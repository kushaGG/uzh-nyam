Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :catalogs do
    resources :reviews
  end

  resources :categories do
    resources :catalogs
  end
end
