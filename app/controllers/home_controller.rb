class HomeController < ApplicationController
  def index
    @room = Room.new

    respond_to do |format|
      format.json { render json: @room, statue: :ok }
    end
  end
end
