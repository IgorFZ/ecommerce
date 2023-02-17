Rails.application.routes.draw do
  resources :posts
  resources :products
  resources :categories
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  put '/users/:id', to: 'members#update_info'
end
