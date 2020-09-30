Rails.application.routes.draw do
  resources :posts
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
  end
  root "users#new"
end
