class VueUsersController < ApplicationController
  def create
    email = params[:email]
    user = User.find_by(email: email)
    if user.nil?
      user = User.create!(email: email, password: Devise.friendly_token[0,20], password_confirmation: Devise.friendly_token[0,20])

      render json: {result: "create", user: user}
    else
      render json: {result: "find", user: user}
    end
  end
end
