Rails.application.routes.draw do
  get 'charts/downloads_by_day'

  devise_for :users
  root 'dashboard#index'
  resources :meals
  resource :profile
end
