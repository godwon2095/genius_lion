class HomeController < ApplicationController
  def index
    @room = Room.new
  end
end
