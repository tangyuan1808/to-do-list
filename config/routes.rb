Rails.application.routes.draw do
  root to: 'home#index'
  resources :users
  get 'signup', to: 'users#new', as: 'signup'
end
