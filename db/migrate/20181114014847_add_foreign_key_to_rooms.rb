class AddForeignKeyToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :channel, foreign_key: true
  end
end
