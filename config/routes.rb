Rails.application.routes.draw do
  root "rooms#index"
  resources :rooms
  # get 'rooms/index'
  # get 'rooms/show'
  # get 'rooms/new'
  # get 'rooms/create'
  # get 'rooms/edit'
  # get 'rooms/update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
