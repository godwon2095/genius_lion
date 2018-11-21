class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])

    render json: @game, status: :ok
  end
end
