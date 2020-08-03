Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  root 'posts#index'
  resources :posts
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
