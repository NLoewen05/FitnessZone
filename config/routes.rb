Rails.application.routes.draw do
  devise_for :users, path: 'users'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pages

  get 'search_result', to: 'pages#search_result', as: 'search_result'

  get 'product/new', to: 'pages#new_product', as: 'new'

  get 'product/updated', to: 'pages#updated_product', as: 'recently_updated'

  get 'product/:id',  to: 'pages#details', id: '/\d+/', as: 'details'

  get 'about', to: 'pages#about', as: 'about'

  get 'contact', to: 'pages#contact', as: 'contact'

  get 'categories/:id', to: 'pages#categories', id: '\/d+/', as: 'categories'

  post 'product/:id/add_to_cart', to: 'order#add_to_cart', as: 'add_to_cart', number: /\d+/

  post 'shopping_cart/remove_from_cart/:id', to: 'order#remove_from_cart', as: 'remove_from_cart', number: /\d+/

  post 'shopping_cart/increase_item_quantity/:id', to:'order#increase_item_quantity', as: 'increase_item_quantity', number: /\d+/

  post 'shopping_cart/decrease_item_quantity/:id', to:'order#decrease_item_quantity', as: 'decrease_item_quantity', number: /\d+/

  post 'shopping_cart/remove_all_from_cart', to: 'order#remove_all_from_cart', as: 'remove_all_from_cart'

  get 'shopping_cart', to: 'order#index', as: 'shopping_cart'

  get 'check_customer', to: 'order#check_customer', as: 'check_customer'

  get 'check_out', to: 'order#check_out', as: 'check_out'

  root to: 'pages#home', as: 'home'
end

