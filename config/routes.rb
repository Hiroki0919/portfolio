Rails.application.routes.draw do
  root 'posts#index'
  post '/guest', to: 'guest_sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :comments, only: [:create, :destroy]
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :feels, only: [:create, :destroy]
  end
end
