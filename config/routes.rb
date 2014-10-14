Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  get '/play', to: 'play#index'
  post '/play', to: 'play#index'
end
