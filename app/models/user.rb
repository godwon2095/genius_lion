class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  enum gender: [:default, :male, :female, :others]

  has_many :friends, dependent: :destroy
  has_many :user_alarms, dependent: :destroy

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil? #user가 nil인 경우 user를 새로 만든다.
      email = auth.info.email #이미 있는 이메일인지 확인
      user = User.where(email: email).first
      unless user.present? #email에 해당하는 user가 없는 경우 새로 생성한
        user = User.new(
          email: auth.info.email,
          name: auth.info.name,
          password: Devise.friendly_token[0,20]
        )
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

  def is_friend(other_user)
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
end
