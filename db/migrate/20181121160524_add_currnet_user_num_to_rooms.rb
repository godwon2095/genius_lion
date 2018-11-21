class AddCurrnetUserNumToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :max_user_num, :integer
    add_column :rooms, :current_user_num, :integer, default: 0
  end
end
