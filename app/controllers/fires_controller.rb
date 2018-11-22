class FiresController < ApplicationController
  before_action :authenticate_user!

  def create #강퇴
    @room = Room.find(params[:room_id])
    fired_user = User.find(params[:id])
    fire = Fire.create(user: fired_user, room: @room)

    render json: {room: @room,
                  fired_user: fired_user,
                  fire: fire}, status: :ok
  end
end
