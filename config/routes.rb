Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#show'
  resources :home_offices, only: :create
end
