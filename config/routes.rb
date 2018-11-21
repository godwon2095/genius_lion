Rails.application.routes.draw do
  root 'home#index'

  get 'pages/welcome'
  get 'pages/test'

  resources :profiles, only: [:show]
  resources :ranks, only: [:show]
  resources :friends, only: [:create, :show] do
    member do
      get :add_friend, as: 'add'
      delete :delete_friend, as: 'delete'
    end
  end
  resources :user_alarms, only: [:show] do
    member do
      post :allow_friend
      delete :reject_friend
      delete :cancel_friend
      delete :delete_alarm, as: 'delete'
    end
  end
  resources :games, only: :show
  resources :rooms, only: [:create, :show, :edit, :update, :destroy] do
    member do
      post :game_start, as: :game_start
      post :start_zombie_round1, as: :zombie_round1
      post :start_zombie_round2, as: :zombie_round2
      post :start_zombie_round3, as: :zombie_round3
      post :zombie_end, as: :zombie_end
    end
    resources :items, only: [:index] do
      member do
        post :use ## 아이템 사용하는 부분
      end
    end
    resources :fires, only: :dontuse do
      member do
        post :create
      end
    end
  end
  resources :items, only: [:dontuse] do
    member do
      post :send_require ## 좀비게임에서 아이템 교환 요청을 보내는 부분
      post :allow ## 좀비게임에서 플레이어 상호간의 아이템 교환하는 부분
    end
  end
  resources :channels, only: [:show]
  resources :readies, only: [:toggle] do
    member do
      post :toggle
    end
  end
  resources :touches, only: [:dontuse] do
    member do
      post :send_require
      post :allow ## 터치 요청 수락 (플레이어 알람 컨트롤러 방대해지는 것 막기위해 터치 컨트롤러에서 처리)
    end
  end
  resources :player_alarms, only: :destroy do
    member do
      delete :after_time_destroy ## 게임알람으로 인한 혼란을 방지하기 위해 알람 수락 및 거절 누르지 않을 시 알람 요청 5초 후 사라지게끔 하는부분
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get 'users/before_sign_in' => "users/sessions#before_sign_in", as: 'before_sign_in'
  end

  post '/tinymce_assets' => 'tinymce_assets#create'
  post '/direct_upload' => 'uploads#direct_upload', as: :direct_upload

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
