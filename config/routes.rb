Rails.application.routes.draw do
  get 'charts/downloads_by_day'
  devise_for :users
  root 'dashboard#index'

  resources :meals
  resources :products
  resources :activities

  resource :profile
end
