class ReadiesController < ApplicationController
  # before_action :authenticate_user!

  def toggle
    room = Room.find(params[:id])
    ready = Ready.find_by(user: current_vue_user, room: room)

    if ready.nil?
      ready = Ready.create(user: current_vue_user, room: room)
      render json: {ready: ready, create: "success~!"}, status: :ok
    else
      ready.destroy
      render json: {destroy: "success!"}
    end
  end
end
