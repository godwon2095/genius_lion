class CreateUserAlarms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_alarms do |t|
      t.references :user, foreign_key: true
      t.integer :send_user_id
      t.integer :alarm_type
      t.string :body

      t.timestamps
    end
    add_index :user_alarms, :send_user_id
    add_index :user_alarms, [:user_id, :send_user_id, :body], unique: true
  end
end
