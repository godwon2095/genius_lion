class FriendsController < ApplicationController

  def add_friend
    @user = User.find(params[:id])
  end

  def allow_friend
    @user1 = User.find(params[:id])
  end

  def delete_friend

  end

end
