Rails.application.routes.draw do
  resources :users, only: [:index, :show, :destroy, :update, :create]
  resources :artworks, only: [:index, :show, :destroy, :update, :create]
  resources :artwork_shares, only: [:create, :destroy]
end
