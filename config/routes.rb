Rails.application.routes.draw do
  root to: 'sessions#new'

  get 'signup', to: 'users#signup', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :lists do
    resources :to_dos
  end
end
