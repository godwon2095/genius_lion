class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
