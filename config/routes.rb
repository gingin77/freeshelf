Rails.application.routes.draw do
  resources :books
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'books#index'
end

#
# Rails.application.routes.draw do
#   resources :books do
#     collection do
#       get "genres/:genre", action: :genre, as: :genre
#     end
#   end
# end
#
# get "/books/genres/:genre", controller: :books, action: :genre, as: :genre
