# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'jsw2095@naver.com', name: "seongwon", password: "111111", password_confirmation: "111111")
# User.create!(email: 'qwe@naver.com', name: 'donaskwhy', ruby_count: '3', join_game_count: '5', win_game_count: '3', password: 'password', password_confirmation: 'password') if Rails.env.development?
# User.create!(email: 'asd@naver.com', name: 'geniuslion', ruby_count: '1', join_game_count: '5', win_game_count: '1', password: 'password', password_confirmation: 'password') if Rails.env.development?
# User.create!(email: 'zxc@naver.com', name: '퍄퍄', ruby_count: '2', join_game_count: '5', win_game_count: '2', password: 'password', password_confirmation: 'password') if Rails.env.development?
# Game.find_or_create_by(title)
Item.generate_items
