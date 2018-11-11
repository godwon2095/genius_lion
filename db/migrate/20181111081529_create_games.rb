class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :content

      t.timestamps
    end
  end
end
