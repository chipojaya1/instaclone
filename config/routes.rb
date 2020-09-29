Rails.application.routes.draw do
  resources :users do
  end
  root "users#new"
end
