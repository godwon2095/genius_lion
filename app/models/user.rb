class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  enum gender: [:default, :male, :female, :others]

  has_one :identity, dependent: :destroy

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
end
