ActiveAdmin.register User do
  menu parent: "사용자관리"

  index do
  selectable_column
    id_column
    column "프로필 사진" do |user|
      if user.image?
        image_tag user.image, class: "admin-indexImage"
      else
        image_tag "default_profile.jpg", class: "admin-indexImage"
      end
    end
    column :email
    column :name
    column :sign_in_count
    column :join_game_count

    actions
  end
end
