class Touch < ApplicationRecord
  after_create :touch_result

  belongs_to :room
  belongs_to :player1, class_name: 'Player'
  belongs_to :player2, class_name: 'Player'

  def touch_result
    if self.player1.state == "zombie" && self.player2.state == "default"
      player2.update(state: "zombie", changed_at: Time.now)
    elsif self.player2.state == "zombie" && self.player1.state == "default"
      self.player1.update(state: "zombie", changed_at: Time.now)
    elsif self.player1.state == "first_zombie" && self.player2.state == "default"
      self.player2.update(state: "zombie", changed_at: Time.now)
    elsif self.player2.state == "first_zombie" && self.player1.state == "default"
      self.player1.update(state: "zombie", changed_at: Time.now)
    elsif player1.state == "default" && player2.state == "default"
      self.player1.score += 1
      self.player1.save
      self.player2.score += 1
      self.player2.save
    end
  end
end
