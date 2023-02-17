Rails.application.routes.draw do
  resources :order_items
  resources :posts
  resources :products
  resources :categories
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#current_user'
  put '/users/:id', to: 'members#update_info'

  get '/order', to: 'orders#add_to_cart'
end
