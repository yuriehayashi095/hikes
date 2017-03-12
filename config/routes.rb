Rails.application.routes.draw do
  get 'users/new'
  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
      member do
      get 'followings'
      get 'followers'
      get 'favorites'
    end
    end
  resources :hikes
  resources :relationships, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites,     only: [:create, :destroy]
end