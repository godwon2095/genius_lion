class PlayerAlarmsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @alarm = PlayerAlarm.find(params[:id])
    @alarm.destroy

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json {render: @alarm}
    end
  end

  def after_time_destroy ## 게임알람으로 인한 혼란을 방지하기 위해 알람 수락 및 거절 누르지 않을 시, 알람 요청 5초 후 사라지게끔 하는부분 ##REVIEW
    @alarm = PlayerAlarm.find(params[:id])

    respond_to do |format|
      format.html {redirect_back(fallback_location: root_path)}
      format.json { render json: @alarm }
    end
  end
end
