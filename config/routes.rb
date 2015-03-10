Rails.application.routes.draw do
  devise_for :users
  root 'states#index'
  resources :info, only: [:index]
  resources :states, only: [:index, :show] do
    resources :breweries, only: [:index, :show, :redirect]
    resources :cities, only: [:show]
  end
  resources :search, only: [:index]
  resources :user_breweries, only: [:create]
end
