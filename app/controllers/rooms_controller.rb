class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :private_setting, only: :create

  def create
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_path(@room), notice: "방이 성공적으로 만들어졌습니다." }
        format.json { render json: @room}
      else
        format.html {redirect_to root_path, notice: "방을 생성할 수 없습니다."}
        format.json { render json: @room.errors }
      end
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def room_create_params
    params.require(:room).permit(:user_id, :game_id, :title, :password)
  end

  def private_setting
    @room = Room.new(room_create_params)
    @room.is_private = true if @room.password != ""
  end
end
