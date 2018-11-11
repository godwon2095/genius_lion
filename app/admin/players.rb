# ActiveAdmin.register Player do
#   permit_params :user_id, :state, :point
#   actions :index, :edit, :update
#   belongs_to :room
#
#   batch_action "아이템 제공", form: {
#     # "game" => Game.pluck('title'), #REVIEW 마이그레이트 할 때 주석처리
#     item: [['해독제', '해독제'], ['물채운해독제', '물채운해독제']]
#   } do |ids, inputs|
#     Player.where(id: ids).find_each do |player|
#       player.items.destroy_all
#       player.items << Item.find_by(name: inputs["item"])
#       ActionCable.server.broadcast "current_user_#{player.user.id}_channel", broad_type: "item_offer", content: "아이템이 지급되었습니다. 확인해보세요."
#     end
#     redirect_back(fallback_location: root_path, notice: "아이템이 성공적으로 제공되었습니다.")
#   end
#
#   index do
#   selectable_column
#     id_column
#     column "프로필 사진" do |player|
#       if player.user.image?
#         image_tag player.user.image.url, class: "admin-indexImage"
#       else
#         image_tag "genius1.png", class: "admin-indexImage"
#       end
#     end
#     column '플레이어 이름'  do |player|
#       player.user.name
#     end
#     column '터치한 유저' do |player|
#       Touch.where(player1: player).map{|t| status_tag t.player2.user.name}
#       nil
#       Touch.where(player2: player).map{|t| status_tag t.player1.user.name}
#       nil
#     end
#     column '보유아이템' do |player|
#       player.items.map {|i| status_tag i.name}
#       nil
#     end
#     tag_column :point
#     tag_column '상태' do |player|
#       player.kor_name
#     end
#
#     actions
#   end
#
#   form do |f|
#     f.inputs do
#       f.input :state
#       f.input :point
#     end
#     f.actions
#   end
# end
