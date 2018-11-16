class ReadiesController < ApplicationController
  before_action :authenticate_user!

  def toggle
    room = Room.find(params[:id])
    ready = Ready.find_by(user: current_user, room: room)

    if ready.nil?
      Ready.create(user: current_user, room: room)
    else
      ready.destroy
    end

    redirect_back(fallback_location: root_path)
  end
end
