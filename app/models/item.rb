class Item < ApplicationRecord
  belongs_to :game

  has_and_belongs_to_many :players

  enum state: [:usable, :not_usable] #사용가능, 사용불가능 아이템

  KOR_NAME = {usable: "사용가능", not_usable: "사용불가"}

  def kor_name
    KOR_NAME[self.state.to_sym]
  end

  def self.generate_items
    %w(해독제 물채운해독제).each do |item_name|
      item = Item.find_or_create_by(name: item_name, game: Game.first, state: "usable")
    end
    Item.create(name: "사용한해독제", game: Game.first, state: "not_usable", image: "empty_antidote.png")
  end
end
