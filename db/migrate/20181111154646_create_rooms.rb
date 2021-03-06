class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user
      t.boolean :is_private, default: false
      t.string :password, default: ""
      t.string :title
      t.string :room_number
      t.text :notice
      t.string :image
      t.integer :step, default: 0
      t.datetime :changed_at

      t.timestamps
    end
  end
end
