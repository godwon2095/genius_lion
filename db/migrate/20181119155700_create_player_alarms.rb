class CreatePlayerAlarms < ActiveRecord::Migration[5.2]
  def change
    create_table :player_alarms do |t|
      t.references :player, foreign_key: true
      t.integer :send_player_id
      t.integer :alarm_type
      t.string :body

      t.timestamps
    end
    add_index :player_alarms, :send_player_id
    add_index :player_alarms, [:player_id, :send_player_id, :body], unique: true
  end
end
