Rails.application.routes.draw do
  devise_for :users, path: 'users'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pages
  root to: 'pages#home', as: 'home'

  get 'product/:id',  to: 'pages#details', id: '/\d+/', as: 'details'

  get 'about', to: 'pages#about', as: 'about'

  get 'contact', to: 'pages#contact', as: 'contact'

  get 'product/:productcategory', to: 'pages#category_search', id: '\/d+/', as: 'categories'
end
