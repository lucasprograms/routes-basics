Rails.application.routes.draw do
  resources :users, only: [:index, :show, :destroy, :update, :create] do
    resources :artworks, only: [:index]
  end
  resources :artworks, only: [:show, :destroy, :update, :create]
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy] 
end
