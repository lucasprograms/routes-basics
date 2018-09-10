Rails.application.routes.draw do
  resources :users, only: [:index, :show, :destroy, :update, :create]
  resources :artworks, only: [:show, :destroy, :update, :create]
  get '/users/:user_id/artworks', to: 'artworks#index'
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  get '/comments/:user_id', to: 'comments#index'
  get '/comments/:artwork_id', to: 'comments#index'
end
