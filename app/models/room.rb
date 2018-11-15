class Room < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  has_many :players, dependent: :destroy

  after_create :create_guardian

  private
  def create_guardian
    Player.create(user: self.user, room: self, is_guardian: true)
  end
end
