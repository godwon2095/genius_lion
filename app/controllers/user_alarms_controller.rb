class UserAlarmsController < ApplicationController
  # before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @user_alarms = @user.user_alarms

    render json: { user: @user, user_alarms: @user_alarms }, status: :ok
  end

  def delete_alarm
    @user_alarm = UserAlarm.find(params[:id])
    @user_alarm.destroy

    respond_to do |format|
      format.json { render json: { user1: @user1, user2: @user2 }, status: :ok }
    end
  end

  def allow_friend #친구 신청 수락
    @user_alarm = UserAlarm.find(params[:id])
    @user1 = @user_alarm.user
    @user2 = @user_alarm.send_user
    if @user1.id > @user2.id ##중복생성 방지위해 항상 id값이 큰 것이 plyaer2_id에 저장되도록
      Friend.create(user1_id: @user2.id, user2_id: @user1.id)

      respond_to do |format|
        format.json { render json: { user_alarm: @user_alarm,
                                     user1: @user1,
                                     user2: @user2 }, status: :ok }
      end
    else
      Friend.create(user1_id: @user1.id, user2_id: @user2.id)

      respond_to do |format|
        format.json { render json: { user1: @user1,
                                     user2: @user2 }, status: :ok }
      end
    end
    @user_alarm.destroy

    respond_to do |format|
      format.json { render json: @user_alarm, status: :ok }
    end
  end

  def reject_friend #친구 신청 거절
    @user_alarm = UserAlarm.find(params[:id])
    @user_alarm.destroy

    respond_to do |format|
      format.json { render json: @user_alarm, status: :ok }
    end
  end

  def cancel_friend #친구 신청 취소
    @user1 = User.find(params[:id])
    @user2 = current_user
    @friendrequest = UserAlarm.find_by(user_id: @user1.id, send_user_id: @user2.id)
    @friendrequest.destroy

    respond_to do |format|
      format.json { render json: { user1: @user1,
                                   user2: @user2,
                                   friendrequest: @friendrequest }, status: :ok }
    end
  end

end
