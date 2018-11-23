class VueUsersController < ApplicationController
  def create
    email = params[:email]
    name = params[:name]
    image = params[:image]
    user = User.find_by(email: email)
    if user.nil?
      new_password = "password"
      user = User.create!(email: email,  password: new_password, password_confirmation: new_password, name: name, image: image)

      render json: {result: "create", user: user}
    else
      render json: {result: "find", user: user}
    end
  end
end
