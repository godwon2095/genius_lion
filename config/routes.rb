Rails.application.routes.draw do
  root 'home#index'

  resources :profiles, only: [:show]
  resources :friends, only: [:create] do
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
  resources :rooms, only: [:create, :show, :edit, :update, :destroy] do
    member do
      post :game_start, as: :game_start
      post :start_zombie_round1, as: :zombie_round1, defaults: {format: 'js'}
    end
  end
  resources :channels, only: [:show]
  resources :readies, only: [:toggle] do
    member do
      post :toggle
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
