ActiveAdmin.register Item do
  menu parent: "게임관리"
  permit_params :name, :state, :image, :information, :game_id

  index do
  selectable_column
  id_column
    column :image do |item|
      if item.image?
        image_tag item.image.url, class: "admin-indexImage"
      end
    end
    tag_column '게임' do |item|
      item.game.title
    end
    column :name
    tag_column '사용가능여부' do |item|
      item.kor_name
    end
    column :information

    actions
  end
end
