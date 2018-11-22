class ChannelsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_params, only: :show

  def show
    @room = Room.new
    @rooms = Room.where(channel: @channel, step: "before_start")

    respond_to do |format|
      format.html
      format.json { render json: {new_room: @room, rooms: @rooms, channel: @channel}, status: :ok }
    end
  end

  private
  def set_params
    @channel = Channel.find(params[:id])
  end
end
