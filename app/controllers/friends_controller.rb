class FriendsController < ApplicationController

  def add_friend
    @user = User.find(params[:id])
    send_user = User.find_by(user: current_user)
    alarm = Alarm.create(user_id: @user.id, send_user_id: send_user.id, body: "#{current.user.name}님이 친구 요청을 보냈습니다.", alarm_type: "friend")
  end

  def allow_friend
    @alarm = Alarm.find(params[:id])
    @user1 = @alarm.user
    @user2 = @alarm.send_user

    if @user1.id > @user2.id ##중복생성 방지위해 항상 id값이 큰 것이 plyaer2_id에 저장되도록
      Friend.create(user1_id: @user2.id, user2_id: @user1.id)
    else
      Friend.create(user1_id: @user1.id, user2_id: @user2.id)
    end

  end

  def delete_friend

  end

end
