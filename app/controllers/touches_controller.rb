class TouchesController < ApplicationController
  # before_action :authenticate_user!

  def send_require ## 터치 요청을 보내는 컨트롤러
    @player = Player.find(params[:id])
    send_player = Player.find_by(room: @player.room, user: current_vue_user)
    @recieve_user = @player.user
    player_alarm = PlayerAlarm.find_by(player_id: @player.id, send_player_id: send_player.id, alarm_type: "touch")
    if player_alarm.nil?
      player_alarm = PlayerAlarm.create(player_id: @player.id, send_player_id: send_player.id, body: "#{current_vue_user.name}님이 터치 요청을 보냈습니다.", alarm_type: "touch")
    end
    ## 푸셔 코드 짜주기

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json {render json: {recieve_player: @player,
                                 recieve_user: @recieve_user,
                                 send_player: send_player,
                                 player_alarm: player_alarm}, status: :ok}
    end
  end

  def allow ## 터치 요청을 수락하는 컨트롤러
    @player_alarm = PlayerAlarm.find(params[:id])
    @player1 = @player_alarm.player
    @player2 = @player_alarm.send_player

    if @player1.id > @player2.id ## 중복생성 방지위해 항상 id값이 큰 것이 plyaer2_id에 저장되도록
      touch = Touch.create(room: @player1.room, player1_id: @player2.id, player2_id: @player1.id)
    else
      touch = Touch.create(room: @player1.room, player1_id: @player1.id, player2_id: @player2.id)
    end

    ## 누구와 누구가 터치했는지 전체 체널로 알려주고
    ## 각각의 화면 변화시켜주는 푸셔 코드
    if @player_alarm.destroy
      respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
        format.json {render json: {player_alarm: @player_alarm,
                                   player1: @player1,
                                   player2: @player2,
                                   touch: touch}, status: :ok}
      end
    else
      respond_to do |format|
        format.json { render json: @player_alarm.errors.full_messages }
      end
    end
  end
end
