class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_room_user!, only: :list

  def list
    @items = Player.find_by(room: @room, user: current_user).items
  end

  def send_require
    @player = Player.find(params[:id])
    send_player = Player.find_by(room: @player.room, user: current_user)
    @recieve_user = @player.user
    player_alarm = PlayerAlarm.create(player_id: @player.id, send_player_id: send_player.id, body: "#{current_user.name}님이 아이템교환 요청을 보냈습니다.", alarm_type: "exchange")
    ## 상대방에게 아이템 교환 요청이 갔다는 알람 푸셔코드로 짜주기

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json {render json: @player}
    end
  end

  def allow
    @alarm = Alarm.find(params[:id])
    player1 = @alarm.player
    player2 = @alarm.send_player
    player1_item = player1.items.first
    player2_item = player2.items.first
    player1.items.destroy_all
    player1.items << player2_item
    player2.items.destroy_all
    player2.items << player1_item
    @alarm.destroy

    ## 두 플레이어에게 아이템 교환이 성공적으로 이루어졌다는 푸셔코드 짜주기

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json {render json: @player}
    end
  end

  private
  def check_room_user! ## 해당방에서 게임 진행하는 사람만 접근할 수 있게
    @room = Room.find(params[:id])
    ids = @room.players.pluck('user_id')
    redirect_to root_path, notice: "잘못 된 요청입니다." unless ids.include?(current_user.id)
  end
end
