class Game < ApplicationRecord
  has_one :channel

  after_create :generate_channel

  mount_uploader :image, GameUploader

  private

  def generate_channel
    Channel.create(game: self, position: self.id)
  end
end
