Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :lists, only: [:index, :new, :create, :edit, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
