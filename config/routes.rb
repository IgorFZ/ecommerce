Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  put '/member-edit', to: 'members#update'
  put '/users/:id', to: 'members#update_info'
end
