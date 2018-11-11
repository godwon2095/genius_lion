class UserAlarm < ApplicationRecord
  belongs_to :user
  belongs_to :send_user, class_name: 'User'

  enum alarm_type: [:friend]
end
