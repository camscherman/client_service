Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'shipments/create'
    end
  end

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

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders, only: [:update]
      resources :shipments, only: [:create]
    end
  end
end
