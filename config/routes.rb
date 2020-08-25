Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/index'
  get 'investments/index'
  get 'funding_rounds/new'
  get 'funding_rounds/create'
  get 'funding_rounds/index'
  get 'funding_rounds/interested'
  root to: 'pages#home'
  resources :funding_rounds, only: [:index] do
    member do
      post 'interested'
    end
  end

  resources :users, only: [:show, :edit, :update, :index] do
    resources :funding_rounds, only: [:new, :create, :index] do
      resources :investments, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
end
