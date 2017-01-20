Rails.application.routes.draw do
  devise_for :users
  if AuthenticationType.cas?
    devise_scope :user do
      get '/users/sign_out' => 'devise/cas_sessions#destroy'
    end
  end

  root to: 'dashboard#show'
  resources :home_offices, only: [:create, :destroy]
  resources :teams, only: [:index, :new, :create]
  resources :user, only: :update
end
