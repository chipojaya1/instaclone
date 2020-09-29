Rails.application.routes.draw do
  get 'sessions/new'
  resources :users do
  end
  root "users#new"
end
