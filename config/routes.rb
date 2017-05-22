Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, controllers: { registrations: 'registrations'}

  get '/home', to: 'home#index'
  get '/setting', to: 'home#setting'

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
