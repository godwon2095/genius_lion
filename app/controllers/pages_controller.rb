class PagesController < ApplicationController
  def welcome
    puts "welcome"
    @data = {
      wonno: "원노",
      twono: "장순호",
      three: "미정"
    }
  end

  def test
    puts "test"
  end
end
