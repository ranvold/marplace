Rails.application.routes.draw do
  root to: 'cars#index'

  resources :cars
  resources :models
  resources :submodels
  resources :dealers
  resources :brands
end
