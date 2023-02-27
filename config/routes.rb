Rails.application.routes.draw do
  resources :order_items
  resources :posts
  resources :products
  resources :categories
  resources :webhooks, only: [:create]
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#current_user'
  put '/users/edit', to: 'members#update_info'

  get '/add', to: 'orders#add_to_cart'
  get '/cart', to: 'orders#get_user_cart'
  get '/orders', to: 'orders#get_user_orders'

  get '/checkout', to: 'checkout#new'
  get '/coupon', to: 'checkout#check_coupon'
end
