Rails.application.routes.draw do

  get 'play/index'
  post 'play/index'

  root 'users#new'
  resources :users
end
