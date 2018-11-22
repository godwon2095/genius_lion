class VueUsersController < ApplicationController
  def create
    email = params[:email]
    name = params[:name]
    image = params[:image]
    user = User.find_by(email: email)
    if user.nil?
      new_password = Devise.friendly_token[0,20]
      user = User.create!(email: email,  password: new_password, name: name, remote_image_url: image, password_confirmation: new_password)

      render json: {result: "create", user: user}
    else
      render json: {result: "find", user: user}
    end
  end
end
