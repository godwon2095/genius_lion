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
      delete :delete_alarm, as: 'delete'
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
