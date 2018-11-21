class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])

    render json: @user, status: :ok
  end

end
