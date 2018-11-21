class Player < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # has_many :touches, dependent: :destroy
  has_many :player_alarms, dependent: :destroy

  has_and_belongs_to_many :items

  enum state: [:default, :zombie, :first_zombie]

  KOR_NAME = {default: "인간", zombie: "좀비", first_zombie: "최초좀비"}

  def kor_name
    KOR_NAME[self.state.to_sym]
  end

  def self.calculate_person(room)
    self.where(room: room, state: "default").size
  end

  def self.calculate_zombie(room)
    self.where(room: room, state: "zombie").size + self.where(room: room, state: "first_zombie").size
  end
end
