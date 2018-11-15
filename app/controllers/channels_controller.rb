class ChannelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params, only: :show

  def show
    @rooms = Room.where(channel: @channel)
  end

  private
  def set_params
    @channel = Channel.find(params[:id])
  end
end
