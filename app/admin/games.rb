ActiveAdmin.register Game do
  menu parent: "게임관리"
  permit_params :title, :content, :image

  index do
  selectable_column
  id_column
    column :image do |game|
      if game.image?
        image_tag game.image.url, class: "admin-indexImage"
      end
    end
    column :title
    column :created_at
    column :updated_at

    actions
  end

  form do |f|
  f.inputs do
    f.input :title
    f.input :image
    f.input :content, input_html: {class: "tinymce", :rows => 40, :cols => 120}
  end
  f.actions
end
end
