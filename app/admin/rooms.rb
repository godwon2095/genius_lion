ActiveAdmin.register Room do
  menu parent: "게임관리"
  permit_params :admin_user_id, :title, :content, :game_id, :image

  batch_action "단계 수정", form: {
    "step" => [["시작 전", "before_start"],["게임시작","start"],["라운드1","round1"],["라운드2","round2"],["라운드3","round3"],["게임 종료","end"]],
  } do |ids, inputs|
    Room.where(id: ids).find_each do |room|
      room.update(step: inputs[:step])
      if inputs[:step] == "start"
        # Player.where(room: room).destroy_all if Player.where(room: room).present?
        joins = Join.where(room: room)
        first_zombie_ids = []
        joins.sample(joins.size * 1/5).each do |join|
          Player.create(room: room, user: join.user, state: "first_zombie", changed_at: Time.now - 600)
          first_zombie_ids << join.id
        end
        joins.where.not(id: first_zombie_ids).each do |join|
          Player.create(room: room, user: join.user)
        end
        # if joins.pluck('user_id').include?(current_user.id)
          ActionCable.server.broadcast "room_step_#{room.id}_channel", title: "#{room.title}", step: "start", game_type: "zombie"
        # end
      end

      if inputs["step"] == "round1"
        ActionCable.server.broadcast "room_step_#{room.id}_channel", title: "#{room.title}", step: "round1", game_type: "zombie"
        room.update(changed_at: Time.now)
        Player.where(room: room).each do |player|
          player.items.destroy_all
          player.items << Item.find_by(name: "해독제")
        end
      end

      if inputs["step"] == "round2"
        Player.where(room: room).each do |player| ## 1라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
          if player.state == "zombie"
            player.update(changed_at: Time.now - 600)
          end
          unless Touch.pluck('player1_id').include?(player.id) || Touch.pluck('player2_id').include?(player.id)
            unless player.state == "zombie" || player.state == "first_zombie"
              player.update(state: "zombie")
            end
          end
        end
        room.update(changed_at: Time.now, content: "인간 : #{Player.calculate_person(room)}     좀비 : #{Player.calculate_zombie(room)}")
        ActionCable.server.broadcast "room_step_#{room.id}_channel", step: "round2", game_type: "zombie"
      end

      if inputs["step"] == "round3"
        Player.where(room: room).each do |player| ## 2라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
          if player.state == "zombie"
            player.update(changed_at: Time.now - 600)
          end
          unless Touch.where(room: room, player1: player).where("created_at > ?", room.changed_at).present? || Touch.where(room: room, player2: player).where("created_at > ?", room.changed_at).present?
            unless player.state == "zombie" || player.state == "first_zombie"
              player.update(state: "zombie")
            end
          end
        end
        room.update(changed_at: Time.now, content: "인간 : #{Player.calculate_person(room)}     좀비 : #{Player.calculate_zombie(room)}")
        ActionCable.server.broadcast "room_step_#{room.id}_channel", step: "round3", game_type: "zombie"
      end

      if inputs["step"] == "end"
        Player.where(room: room).each do |player| ## 3라운드에서 아무와도 터치하지 않았을 경우 좀비로 변하게
          unless Touch.where(room: room, player1: player).where("created_at > ?", room.changed_at).present? || Touch.where(room: room, player2: player).where("created_at > ?", room.changed_at).present?
            unless player.state == "zombie" || player.state == "first_zombie"
              player.update(state: "zombie")
            end
          end
        end
        room.update(changed_at: Time.now, content: "인간 : #{Player.calculate_person(room)}     좀비 : #{Player.calculate_zombie(room)}")
        ActionCable.server.broadcast "room_step_#{room.id}_channel", step: "end", game_type: "zombie"
      end
    end
    redirect_to collection_path
  end

  batch_action "공지하기", form: {
    notice: :textarea
  } do |ids, inputs|
    Room.where(id: ids).find_each do |room|
      ActionCable.server.broadcast "room_step_#{room.id}_channel", broad_type: "notice", content: "#{inputs[:notice]}"
    end

    redirect_to collection_path
  end

  index do
  selectable_column
  id_column
    column '게임이미지' do |room|
      if room.game.image.present?
        image_tag room.game.image.url, class: "admin-indexImage"
      end
    end
    tag_column '게임 종류' do |room|
      room.game.title
    end
    column :title
    column '방장' do |post|
      post.admin_user.name
    end
    tag_column '진행단계' do |room|
      if room.step == "start"
        "게임시작"
      elsif room.step == "round1"
        "라운드1"
      elsif room.step == "round2"
        "라운드2"
      elsif room.step == "round3"
        "라운드3"
      elsif room.step == "end"
        "게임 종료"
      else
        "준비단계"
      end
    end
    column '남은시간(분)' do |room|
      if room.changed_at.present?
        left_time = 1200 - (Time.now - room.changed_at)
        if left_time <= 0
          '종료됨'
        else
          (left_time/60).to_s[0..4]
        end
      end
    end
    column :created_at do |room|
      room.created_at.strftime("%Y-%m-%d %I:%M")
    end

    actions do |room|
      item "플레이어 리스트", admin_room_players_path(room) , class: "member_link"
    end
  end

  form do |f|
    f.inputs do
      f.input :admin_user, as: :select, collection: AdminUser.all.map { |admin_user| [admin_user.name, admin_user.id] }
      f.input :game, as: :select, collection: Game.all.map { |game| [game.title, game.id]}
      # f.input :image
      f.input :title
      # f.input :content, input_html: { class: "admin-textarea"}
    end
    f.actions
  end

end
