class HomeController < ApplicationController
  def index
    @room = Room.new
    @users = User.all.order(ruby_count: :desc)
  end
end
