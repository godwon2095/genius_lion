class UserAlarmsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @alarm = Alarm.find(params[:id])
    @alarm.destroy

    respond_to do |format|
      format.js
    end
  end
end
