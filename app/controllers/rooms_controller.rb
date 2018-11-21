class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :private_setting, only: :create
  before_action :check_ready!, only: :show

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
    @game = @room.channel.game
    @guardian = Player.find_by(room: @room, is_guardian: true)
    @player = Player.find_by(user: current_user, room: @room)
    @players = Player.where(room: @room)

    if @player.present?
      ids_1 = Touch.where(player1_id: @player.id).pluck('player2_id')
      ids_2 = Touch.where(player2_id: @player.id).pluck('player1_id')
      @touched_ids = ids_1 + ids_2
    end
  end

  def game_start # 게임이 시작될 때
    room = Room.find(params[:id])
    game_type = room.channel.game
    if room.step == "before_start"
      if game_type == Game.find_by(title: "좀비게임")
        readies = room.readies
        readies.each do |ready|
          Player.create(room: room, user: ready.user)
        end
        User.includes(:players).where
        players = room.players
        players.sample(players.size * 1/5).each do |player|
          player.update(state: "first_zombie", changed_at: Time.now - 600)
        end

        players.each do |player|
          tmp = player.user.join_game_count
          player.user.update(join_game_count: tmp + 1)
        end

        room.update(step: "zombie_start")

        # 푸셔코드 짜주기 ----
        respond_to do |format|
          format.html { redirect_back(fallback_location: root_path) }
          format.json { render json: @resource }
        end

      elsif game_type == Game.find_by(title: "신분교환")
        # 신분게임 코드 짜주기 ----
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "잘못 된 요청입니다." }
        format.json { render json: @resource.errors }
      end
    end
  end

  def start_zombie_round1 ## 좀비 게임 라운드 1이 시작 되면 정체 잠깐 알려주고 라운드1 로 넘어가도록
    @room = Room.find(params[:id])
    @room.update(step: "zombie_round1", changed_at: Time.now)
    Player.where(room: @room).each do |player|
      player.items.destroy_all
      player.items << Item.find_by(name: "해독제")
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: @room, status: :ok }
    end
  end

  def start_zombie_round2 ## 라운드 1의 시간이 끝나면 자동으로 라운드2로 넘어가는 부분
    @room = Room.find(params[:id])
    Player.where(room: @room).each do |player|
      if player.state == "zombie"
        player.update(changed_at: Time.now - 600) ## 라운드 바뀐 후 해독제 사용하지 못하게
      end
      ## 1라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
      unless Touch.where(room: @room).pluck('player1_id').include?(player.id) || Touch.where(room: @room).pluck('player2_id').include?(player.id)
        unless player.state == "zombie" || player.state == "first_zombie"
          player.update(state: "zombie")
        end
      end
    end
    @room.update(step: "zombie_round2", changed_at: Time.now, notice: "인간 : #{Player.calculate_person(@room)}   좀비 : #{Player.calculate_zombie(@room)}")
    ## 2라운드로 넘어가는 푸셔코드 짜기

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: @room, status: :ok }
    end
  end

  def start_zombie_round3 ## 라운드 2의 시간이 끝나면 자동으로 자운드3로 넘어가는 부분
    @room = Room.find(params[:id])
    Player.where(room: @room).each do |player|
      if player.state == "zombie"
        player.update(changed_at: Time.now - 600) ## 라운드 바뀐 후 해독제 사용하지 못하게
      end
      ## 2라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
      if Touch.where(room: @room, player1: player).where("created_at > ?", @room.changed_at).present? == false && Touch.where(room: @room, player2: player).where("created_at > ?", @room.changed_at).present? == false
        if player.state == "default"
          player.update(state: "zombie")
        end
      end
    end
    @room.update(step: "zombie_round3", changed_at: Time.now, notice: "인간 : #{Player.calculate_person(@room)}   좀비 : #{Player.calculate_zombie(@room)}")
    ## 3라운드로 넘어가는 푸셔코드 짜기
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: @room, status: :ok }
    end
  end

  def zombie_end ## 라운드3 종료되고 게임 종료되는 부분
    @room = Room.find(params[:id])
    room_players = Player.where(room: @room)
    room_players.each do |player|
    if player.state == "zombie"
      player.update(changed_at: Time.now - 600) ## 게임 종료 후 아이템 사용하지 못하게
    end
     ## 3라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
    if Touch.where(room: @room, player1: player).where("created_at > ?", @room.changed_at).present? == false && Touch.where(room: @room, player2: player).where("created_at > ?", @room.changed_at).present? == false
        if player.state == "default"
          player.update(state: "zombie")
        end
      end
    end
    @room.update(step: "zombie_end", changed_at: Time.now, notice: "인간 : #{Player.calculate_person(@room)}   좀비 : #{Player.calculate_zombie(@room)}")
    ## 게임 종료시켜주는 푸셔코드 짜기

    ## 이겼을 시 루비 지급되는 부분
    if room_players.where(state: "default").present? ## 사람이 이겼을 경우
      winners = room_players.where(state: "default")
      winners.each do |winner| ## 얻은 승점만큼 루비 지급
        get_score = winner.score
        tmp = winner.user.ruby_count
        winner.user.update(ruby_count: tmp + get_score)
      end
    else ## 최초 좀비가 이겼을 경우
      winners = room_players.where(state: "first_zombie")
      winners.each do |winner|
        tmp = winner.user.ruby_count
        winner.user(ruby_count: tmp + 3) ## 최초 좀비가 이길 시 루비 3개씩 지급
      end
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.json { render json: @room, status: :ok }
    end
  end


  private
  def room_create_params
    params.require(:room).permit(:user_id, :channel_id, :title, :password)
  end

  def private_setting
    @room = Room.new(room_create_params)
    @room.is_private = true if @room.password != ""
  end

  def check_ready! ## 게임이 시작 된 후 레디 한 유저만 방에 접근할 수 있게
    @room = Room.find(params[:id])
    ids = @room.players.pluck('user_id')
    if @room.step != "before_start"
      redirect_to root_path, notice: "이 방은 게임이 진행 중입니다." unless ids.include?(current_user.id)
    end
  end
end
