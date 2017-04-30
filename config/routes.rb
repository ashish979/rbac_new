Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  get '/home', to: 'home#index'

  resources :users, only: [:index, :show, :new, :edit, :update, :destroy] do
    collection do
      post 'create_user'
    end
    member do
      post 'assign_role'
      post 'unassign_role'
    end
  end

  resources :roles
  post '/roles/:role_id/permissions/:permit_id' => 'roles#set_permission'
  delete '/roles/:role_id/permissions/:permit_id' => 'roles#remove_permission'

  match '*path' => 'pages#error_404', via: %w(get post)
end
