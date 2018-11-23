ActiveAdmin.register Item do
  menu parent: "게임관리"
  permit_params :name, :state, :game_id

  index do
  selectable_column
  id_column
    tag_column '게임' do |item|
      item.game.title
    end
    column :name
    tag_column '사용가능여부' do |item|
      item.kor_name
    end

    actions
  end
end
