class ProfilesController < ApplicationController

  def show
    @user_id = User.find(params[:id])
  end

end
