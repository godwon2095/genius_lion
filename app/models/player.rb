class Player < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_and_belongs_to_many :items

  enum state: [:default, :zombie, :first_zombie]
end
