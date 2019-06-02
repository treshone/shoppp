Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:index]
  post 'cart', to: 'carts#create'
  get 'cart/show', to: 'carts#show'
end
