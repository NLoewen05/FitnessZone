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

  root to: 'pages#home', as: 'home'
end
