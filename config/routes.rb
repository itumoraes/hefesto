Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/cas_sessions#destroy'
  end

  root to: 'dashboard#show'
  resources :home_offices, only: [:create, :destroy]
  resources :teams, only: [:index, :new, :create]
  resources :user, only: :update
end
