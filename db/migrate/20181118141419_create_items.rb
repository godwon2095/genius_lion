class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :game, foreign_key: true
      t.string :name
      t.string :image
      t.text :information
      t.integer :state

      t.timestamps
    end
  end
end
