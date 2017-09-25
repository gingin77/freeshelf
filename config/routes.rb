Rails.application.routes.draw do
  get 'sessions/new'

  resources :books
  # resources :sessions
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'books#index'
end
