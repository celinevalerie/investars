Rails.application.routes.draw do
  root to: 'pages#home'
  resources :funding_rounds, only: [:index] do
    member do
      post 'interested'
    end
  end

  resources :users do
    resources :funding_rounds, only: [:new, :create, :index] do
      resources :investments, only: [:index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    }
end
