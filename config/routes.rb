Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/home', to: 'home#index'
end
