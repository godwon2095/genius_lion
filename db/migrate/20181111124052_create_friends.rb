class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user1_id
      t.integer :user2_id

      t.timestamps
    end
    add_index :friends, :user1_id
    add_index :friends, :user2_id
    add_index :friends, [:user1_id, :user2_id], unique: true
  end
end
