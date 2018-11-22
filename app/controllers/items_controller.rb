class ItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :check_room_user!, only: :index
  before_action :check_ownership!, only: :use

  def index
    @player = Player.find_by(room: @room, user: current_user)
    @items = @player.items
    item = @items.first

    render json: {current_player: @player, current_player_item: item}, status: :ok
  end

  def use
    item_name = @item.name
    if item_name == "해독제"
      if @player.changed_at.present? && Time.now - @player.changed_at >= 600 ## 좀비로 변한지 10분이 지난경우 사용해도 인간으로 바뀌지 않게
        @player.items.destroy_all
        @player.items << Item.find_by(name: "사용한해독제")
      else
        @player.update(state: "default")
        @player.items.destroy_all
        @player.items << Item.find_by(name: "사용한해독제")
      end

      respond_to do |format|
        format.html { redirect_to room_items_path(@room), notice: "해독제를 사용하셨습니다." }
        format.json { render json: @player }
      end

    elsif item_name == "물채운해독제"
      @player.items.destroy_all
      @player.items << Item.find_by(name: "사용한해독제")

      respond_to do |format|
        format.html { redirect_to room_items_path(@room), notice: "뭐..뭐야?? 이거 물이잖아?" }
        format.json { render json: @player }
      end
    end
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
    @player_alarm = PlayerAlarm.find(params[:id])
    player1 = @player_alarm.player
    player2 = @player_alarm.send_player
    player1_item = player1.items.first
    player2_item = player2.items.first
    player1.items.destroy_all
    player1.items << player2_item
    player2.items.destroy_all
    player2.items << player1_item
    @player_alarm.destroy

    ## 두 플레이어에게 아이템 교환이 성공적으로 이루어졌다는 푸셔코드 짜주기

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json {render json: @player}
    end
  end

  private
  def check_room_user! ## 해당방에서 게임 진행하는 사람만 접근할 수 있게
    @room = Room.find(params[:room_id])
    ids = @room.players.pluck('user_id')
    redirect_to root_path, notice: "잘못 된 요청입니다." unless ids.include?(current_user.id)
  end

  def check_ownership! ## 다른 유저가 주소로 현재유저의 아이템 사용하지 못하게
    @room = Room.find(params[:room_id])
    @item = Item.find(params[:id])
    @player = Player.find_by(room: @room, user: current_user)
    redirect_to root_path, notice: "잘못 된 요청입니다." unless current_user.players.include?(@player)
  end
end
