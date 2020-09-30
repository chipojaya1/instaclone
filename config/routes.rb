Rails.application.routes.draw do
  root "users#new"
  get 'favorites/show'
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  resources :posts do
    collection do
      post :confirm
    end
  end
  get 'sessions/new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
  end
end
