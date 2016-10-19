Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/logout' => 'devise/cas_sessions#destroy'
  end

  root to: 'dashboard#show'
  resources :home_offices, only: :create
end
