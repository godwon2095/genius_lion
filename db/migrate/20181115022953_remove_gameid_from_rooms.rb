class RemoveGameidFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :game, foreign_key: true
  end
end
