Rails.application.routes.draw do
  root 'dashboard#index'
  resources :dashboard, only: [:index]
  resources :states, only: [:index, :show]
end
