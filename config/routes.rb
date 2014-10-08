Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users
  
  get 'play/index'
  post 'play/index'

  root 'users#new'
  resources :users
end
