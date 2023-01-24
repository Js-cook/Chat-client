Rails.application.routes.draw do
  resources :messages, only: [:new, :create, :delete]
  # FIX LATER
  get 'user/index'
  get 'user/show'
  get 'user/new'
  post 'user/create'
  get 'user/login'
  post 'user/login_req'
  get 'user/logout'
  root "rooms#index"
  resources :rooms
  # resources :users, except: [:edit, :update, :destroy] do
  #   member do 
  #     get :login
  #     post :login_req
  #     get :logout
  #   end
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
