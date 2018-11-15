class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.references :game, foreign_key: true
      t.integer :position
      t.integer :join_count, default: 0 ## 채널 조회 수
      t.integer :room_created_count, default: 0 ## 방 생성 횟수

      t.timestamps
    end
  end
end
