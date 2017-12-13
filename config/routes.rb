Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/create'

  get 'books/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :catalogs, only: [:index, :show]
  resources :books, only: [:show, :index]
  resources :orders, only: [:show, :create, :index]
end
