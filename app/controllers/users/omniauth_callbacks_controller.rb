# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
        else
          session["devise.#{provider}_data"] = request.env["omniauth.auth"]
          redirect_to new_user_registration_url, notice: '로그인 에러가 발생하였습니다.'
        end
      end
    }
  end

  [:google_oauth2, :naver, :kakao].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    auth = request.env['omniauth.auth']
    @identity = Identity.find_for_oauth(auth)
    if current_user.persisted?
      root_path
    else
      new_user_registration_path
    end
  end
end
