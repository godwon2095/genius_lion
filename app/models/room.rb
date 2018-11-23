class Room < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  has_many :players, dependent: :destroy
  has_many :readies, dependent: :destroy
  has_many :touches, dependent: :destroy
  has_many :fires, dependent: :destroy

  after_create :create_guardian
  before_save :gen_room_number

  enum step: [:before_start, :zombie_start, :zombie_round1, :zombie_round2, :zombie_round3, :zombie_end]

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

  def users_as_json
    self.users.as_json.each do |hash|
      hash[:ready] = is_ready(self)
    end
  end

  # def self.room_specific_statuses(game_type)
  #   if user.admin?
  #     Apt.statuses
  #   else
  #     Apt.statuses.reject { |k, v| k == "publish" } # => all except publish
  #   end
  # end
end
