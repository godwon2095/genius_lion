class Player < ApplicationRecord
  belongs_to :user
  belongs_to :room

  enum state: [:default, :zombie, :first_zombie]
end
