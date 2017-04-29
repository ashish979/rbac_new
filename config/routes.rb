Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get '/home', to: 'home#index'

  resources :users, only: [:index, :show, :new, :edit, :update, :destroy] do
    collection do
      post 'create_user'
    end
  end
end
