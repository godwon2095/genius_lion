class Room < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  has_many :players, dependent: :destroy
  has_many :readies, dependent: :destroy

  after_create :create_guardian
  before_save :gen_room_number

  private
  def create_guardian
    Player.create(user: self.user, room: self, is_guardian: true)
  end

  def gen_room_number
    channel = self.channel
    room_count = channel.rooms.size % 1000

    if room_count / 100 > 0
      self.room_number = "#{room_count}"
    elsif room_count / 10 > 0
      self.room_number = "0" + "#{room_count}"
    else
      self.room_number = "00" + "#{room_count}"
    end
  end
end
