require 'pusher'

Pusher.app_id = ENV["655886"]
Pusher.key = ENV["51a909f5e29cb695b547"]
Pusher.secret = ENV["92b08a386655037a7dd7"]
Pusher.cluster = ENV["ap1"]
Pusher.logger = Rails.logger
Pusher.encrypted = true
