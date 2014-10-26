Rails.application.routes.draw do
  resource :user, only: [:edit, :update] do
    resources :organizations, controller: :organizations_users
  end

  resources :organizations
  root to: 'visitors#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
