class PlayerAlarm < ApplicationRecord
  ## 오직 게임 내부에서만 사용되는 알람 입니다.
  belongs_to :player
  belongs_to :send_player, class_name: 'Player'

  enum alarm_type: [:touch, :exchange]
end
