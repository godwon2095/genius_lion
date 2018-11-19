class ItemsPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :items_players, :id => false do |t|
      t.references :item, foreign_key: true
      t.references :player, foreign_key: true
    end
  end
end
