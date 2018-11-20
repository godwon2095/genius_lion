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
end
