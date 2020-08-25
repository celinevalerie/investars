Rails.application.routes.draw do
  get 'users/index'
  get 'funding_rounds/interested'
  root to: 'pages#home'
  resources :funding_rounds, only: [:index]
  
  resources :users, only: [:show, :edit, :update, :index] do
    collection do
      get "startups"
      get "investors"
    end
    resources :funding_rounds, only: [:new, :create, :index] do
      member do
        post 'interested'
      end
      resources :investments, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }
end
