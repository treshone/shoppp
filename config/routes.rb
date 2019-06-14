Rails.application.routes.draw do
  root to: 'products#index'
  resources :products, only: [:index]
  post 'cart', to: 'carts#create'
  get 'cart/show', to: 'carts#show'
  get 'order_placed', to: 'carts#order_placed'
  resources :orders, only: [:create]
  get 'contacts', to: 'pages#contacts'
end
