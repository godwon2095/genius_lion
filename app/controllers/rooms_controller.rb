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
    @game = @room.channel.game
    @guardian = Player.find_by(room: @room, is_guardian: true)
    @player = Player.find_by(user: current_user, room: @room)
  end

  def game_start ## 게임시작 될 때 사용되는 부분 모든 게임에서 거쳐감
    room = Room.find(params[:id])
    game_type = room.channel.game
    if room.step == "before_start"
      if game_type == Game.find_by(title: "좀비게임")
        readies = room.readies
        readies.each do |ready|
          Player.create(room: room, user: ready.user)
        end
        players = room.players
        players.sample(players.size * 1/5).each do |player|
          player.update(state: "first_zombie", changed_at: Time.now - 600)
        end

        room.update(step: "zombie_start")

        # 푸셔코드 짜주기 ----
        redirect_back(fallback_location: root_path)

      elsif game_type == Game.find_by(title: "신분교환")

      end
    else
      redirect_to root_path, notice: "잘못 된 요청입니다."
    end
  end

  def start_zombie_round1 ## 좀비 게임 라운드 1이 시잘 되면 정체 잠깐 알려주고 라운드1 로 넘어가도록
    @room = Room.find(params[:id])
    @room.update(step: "zombie_round1", changed_at: Time.now)
    Player.where(room: @room).each do |player|
      player.items.destroy_all
      player.items << Item.find_by(name: "해독제")
    end

    render json: @room, status: :ok
  end

  def zombie_round1

  end


  private
  def room_create_params
    params.require(:room).permit(:user_id, :channel_id, :title, :password)
  end

  def private_setting
    @room = Room.new(room_create_params)
    @room.is_private = true if @room.password != ""
  end
end
