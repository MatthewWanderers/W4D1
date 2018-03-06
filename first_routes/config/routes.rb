Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   #resources :users
  get 'users', to: 'users#index', as: 'users'
  post 'users', to: 'users#create'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  get 'users/:id', to: 'users#show', as: 'user'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  get 'users/:user_id/artworks', to: 'artworks#index'

  resources :artworks,
    :except => [:index]

  get 'artwork_shares', to: "artwork_shares#index", as: 'artwork_shares'
  post 'artwork_shares', to: 'artwork_shares#create'
  delete 'artwork_shares/:id', to: 'artwork_shares#destroy'
end
