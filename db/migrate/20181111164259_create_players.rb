class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.boolean :is_guardian, default: false
      t.integer :state
      t.integer :score, default: 0
      t.datetime :changed_at

      t.timestamps
    end
  end
end
