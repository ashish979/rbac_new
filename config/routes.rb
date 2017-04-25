Rails.application.routes.draw do
  root 'home#index'

  get '/home', to: 'home#index'
end
