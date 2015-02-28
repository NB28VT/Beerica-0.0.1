Rails.application.routes.draw do
  root 'dashboard#index'
  resources :dashboard, only: [:index]
  resources :states, only: [:index, :show] do
    resources :breweries, only: [:index, :show, :redirect]
    resources :cities, only: [:show]
  end
end
