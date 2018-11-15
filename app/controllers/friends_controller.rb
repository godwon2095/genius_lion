class FriendsController < ApplicationController

  def add_friend #친구 요청 보내기
    @user = User.find(params[:id])
    send_user = current_user
    UserAlarm.create(user: @user, send_user_id: send_user.id, body: "#{current_user.name}님이 친구 요청을 보냈습니다.", alarm_type: "friend")
  end

  def delete_friend #친구 삭제
    @user1 = User.find(params[:id])
    @user2 = current_user

    if @user1.id < @user2.id ##중복생성 방지위해 항상 id값이 큰 것이 plyaer2_id에
      friendship = Friend.find_by(user1_id: @user1.id, user2_id: @user2.id)
    else
      friendship = Friend.find_by(user1_id: @user2.id, user2_id: @user1.id)
    end

    friendship.destroy

  end
end
