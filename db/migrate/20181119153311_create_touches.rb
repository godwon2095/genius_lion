class CreateTouches < ActiveRecord::Migration[5.2]
  def change
    create_table :touches do |t|
      t.references :room, foreign_key: true
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
    add_index :touches, :player1_id
    add_index :touches, :player2_id
    add_index :touches, [:player1_id, :player2_id, :room_id], unique: true
  end
end
