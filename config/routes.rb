Rails.application.routes.draw do
  get 'favorites/show'
  resources :posts
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
  end
  root "users#new"
end
