Rails.application.routes.draw do

  namespace :admin do
    get 'combinations/index'
    get 'combinations/new'
    post 'combinations/create'
    get 'combinations/edit'
    post 'combinations/update'
    get 'parts/index'
    get 'parts/new'
    post 'parts/create'
    get 'parts/edit'
    patch 'parts/update'
    get 'products/new'
    post 'products/create'
    get 'products/edit'
    patch 'products/update'
    get 'products/index'
    resources :admin_users
  end
  post 'cart_items/create'
  post 'cart_items/update'
  delete 'cart_items/destroy'
  get 'carts/show'
  get 'parts/index'
  get 'parts/show'
  get 'products/index'
  get 'products/show'
  devise_for :admin_users
  devise_for :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

