Rails.application.routes.draw do
  root 'home#index'

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
