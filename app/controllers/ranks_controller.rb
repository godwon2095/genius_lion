class RanksController < ApplicationController

  def show
    @ruby_ranking = User.all.order(ruby_count: :desc)

    render json: @ruby_ranking, status: :ok
  end

end
