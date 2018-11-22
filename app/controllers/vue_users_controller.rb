class VueUsersController < ApplicationController
  def create
    email = params[:email]
    user = User.find_by(email: email)
    if user.nil?
      new_password = Devise.friendly_token[0,20]
      user = User.create!(email: email, password: new_password, password_confirmation: new_password)

      render json: {result: "create", user: user}
    else
      render json: {result: "find", user: user}
    end
  end
end
