Rails.application.routes.draw do
  resources :posts

  get 'login', to: 'sessions#index'
  get 'register', to: 'sessions#new'

  post 'login', to: 'sessions#login', as: :session_login
  post 'register', to: 'sessions#register', as: :session_register

  root to: 'posts#index'
end
