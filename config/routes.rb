Rails.application.routes.draw do
  root to: 'cars#index'

  devise_for :users

  scope '/api' do
    get 'models/:brand_id', to: 'models#models_by_brand'
    get 'submodels/:model_id', to: 'submodels#submodels_by_model'
  end

  get 'favorites/index'

  resources :favorites, only: %i[ index update ]
  resources :cars
  resources :models
  resources :submodels
  resources :dealers
  resources :brands
end
