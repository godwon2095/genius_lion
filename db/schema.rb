# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_21_161538) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "channels", force: :cascade do |t|
    t.integer "game_id"
    t.integer "position"
    t.integer "join_count", default: 0
    t.integer "room_created_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_channels_on_game_id"
  end

  create_table "fires", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_fires_on_room_id"
    t.index ["user_id"], name: "index_fires_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id", "user2_id"], name: "index_friends_on_user1_id_and_user2_id", unique: true
    t.index ["user1_id"], name: "index_friends_on_user1_id"
    t.index ["user2_id"], name: "index_friends_on_user2_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "content"
    t.integer "min_num"
    t.integer "max_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "game_id"
    t.string "name"
    t.string "image"
    t.text "information"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_items_on_game_id"
  end

  create_table "items_players", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "player_id"
    t.index ["item_id"], name: "index_items_players_on_item_id"
    t.index ["player_id"], name: "index_items_players_on_player_id"
  end

  create_table "player_alarms", force: :cascade do |t|
    t.integer "player_id"
    t.integer "send_player_id"
    t.integer "alarm_type"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id", "send_player_id", "body"], name: "index_player_alarms_on_player_id_and_send_player_id_and_body", unique: true
    t.index ["player_id"], name: "index_player_alarms_on_player_id"
    t.index ["send_player_id"], name: "index_player_alarms_on_send_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.boolean "is_guardian", default: false
    t.integer "state", default: 0
    t.integer "score", default: 0
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_players_on_room_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "readies", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_readies_on_room_id"
    t.index ["user_id"], name: "index_readies_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "is_private", default: false
    t.string "password", default: ""
    t.string "title"
    t.string "room_number"
    t.text "notice"
    t.string "image"
    t.integer "step", default: 0
    t.datetime "changed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "channel_id"
    t.integer "max_user_num"
    t.integer "current_user_num", default: 0
    t.index ["channel_id"], name: "index_rooms_on_channel_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "touches", force: :cascade do |t|
    t.integer "room_id"
    t.integer "player1_id"
    t.integer "player2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player1_id", "player2_id", "room_id"], name: "index_touches_on_player1_id_and_player2_id_and_room_id", unique: true
    t.index ["player1_id"], name: "index_touches_on_player1_id"
    t.index ["player2_id"], name: "index_touches_on_player2_id"
    t.index ["room_id"], name: "index_touches_on_room_id"
  end

  create_table "user_alarms", force: :cascade do |t|
    t.integer "user_id"
    t.integer "send_user_id"
    t.integer "alarm_type"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["send_user_id"], name: "index_user_alarms_on_send_user_id"
    t.index ["user_id", "send_user_id", "body"], name: "index_user_alarms_on_user_id_and_send_user_id_and_body", unique: true
    t.index ["user_id"], name: "index_user_alarms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "image"
    t.datetime "birth"
    t.integer "gender"
    t.integer "ruby_count", default: 0
    t.integer "join_game_count", default: 0
    t.integer "win_game_count", default: 0
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
