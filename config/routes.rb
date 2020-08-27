Rails.application.routes.draw do
  get 'question/new'
  get 'question/create'
  get 'answer/new'
  get 'answer/create'
  get 'answer/index'
  root to: 'pages#home'

  devise_for :users, path: 'users', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'signup' }

  get 'users/index'
  get 'funding_rounds/interested'
  post "/users/:user_id/funding_rounds", to: "funding_rounds#create", as: "create_new_funding"


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
      resources :questions, only: [:new, :create, :index]
      resources :investments, only: [:index] do 
        resources :answer, only: [:new, :create, :index]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
