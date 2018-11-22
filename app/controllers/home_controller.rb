class HomeController < ApplicationController
  def index
    @room = Room.new

    render json: @room, status: :ok
  end
end
