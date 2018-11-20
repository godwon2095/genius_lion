class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  enum gender: [:default, :male, :female, :others]

  has_one :identity, dependent: :destroy
  has_many :friends, dependent: :destroy
  has_many :user_alarms, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :players, dependent: :destroy
  has_many :readies, dependent: :destroy

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil? #user가 nil인 경우 user를 새로 만든다.
      auth_email = auth.info.email #이미 있는 이메일인지 확인
      user = User.where(email: auth_email).first
      unless user.present? #email에 해당하는 user가 없는 경우 새로 생성한
        if auth.info.email.nil?
          user = User.new(
              email: "kakaoUser@#{auth.uid}.com",
              image: auth.info.image,
              name: auth.info.name,
              password: Devise.friendly_token[0,20]
            )
        else
          user = User.new(
              email: auth.info.email,
              image: auth.info.image,
              name: auth.info.name,
              password: Devise.friendly_token[0,20]
          )
        end
        # user.skip_confirmation! # 이메일 인증이 있는 경우 인증을 자동 완료해줌
        user.save!
      end
    end

    if identity.user != user #identity의 유저와 현재 유저를 일치시킨다
      identity.user = user
      identity.save
    end

    user #user 리턴
  end

  def is_friend(other_user) #친구인지 확인
    result = false
    tmp_friend1 = Friend.where(user1: self)
    tmp_friend2 = Friend.where(user2: self)
    if tmp_friend1.present?
      if tmp_friend1.pluck('user2_id').include?(other_user.id)
        result = true
      end
    end
    if tmp_friend2.present?
      if tmp_friend2.pluck('user1_id').include?(other_user.id)
        result = true
      end
    end
    return result
  end

  def sent_friend(other_user) #A가 B에게 친구요청을 보낸 상태인지 확인
    result = false
    friendrequest = UserAlarm.where(send_user: self)
    if friendrequest.present?
      if friendrequest.pluck('user_id').include?(other_user.id)
        result = true
      end
    end
    return result
  end

  def received_friend(other_user) #A가 B로부터 친구요청을 받은 상태인지 확인
    result = false
    friendrequest = UserAlarm.find_by(user_id: self.id, send_user_id: other_user.id)
    if friendrequest.present?
      result = true
    end
  end

  def is_ready(room)
    Ready.find_by(user: self, room: room).present?
  end

  def win_game_rate #게임 랭킹에 쓰이는 게임 승률
    if self.join_game_count.present?
    ((self.win_game_count.to_f / self.join_game_count) * 100).to_i
    end
  end

  def self.sorted_by_win_game_rate #게임 랭킹에 쓰이는 게임 승률
    User.all.sort_by(&:win_game_rate).reverse
  end

  def friends #미완
    tmp_1 = Friend.where(user1: self)
    tmp_2 = Friend.where(user2: self)
    friends = tmp_1 + tmp_2
  end

  def friend_users #친구 정보 불러오기
    a = Friend.where(user1: self )
    aa = a.pluck(:user2_id)
    b = Friend.where(user2: self)
    bb = b.pluck(:user1_id)
    c = bb + aa
    User.find(c)
  end

  # def as_json(*)
  #   super.tap do |hash|
  #     hash[:channel_names] = platforms.map(&:title)
  #     hash[:channels] = platforms.map{|platform| Hash[:title, platform.title, :followers_size, UserPlatform.find_platform(platform.title, self).followers_size]}
  #     hash[:birth_date] = influencer.birth
  #   end
  # end
end
