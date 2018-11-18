class Channel < ApplicationRecord
  belongs_to :game

  has_many :rooms, dependent: :destroy
end
