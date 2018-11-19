class RanksController < ApplicationController
  def show
    @ruby_ranking = User.all.order(ruby_count: :desc)
  end

end
