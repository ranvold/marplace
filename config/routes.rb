Rails.application.routes.draw do
  root to: 'cars#index'

  scope '/api' do
    get 'models/:brand_id', to: 'models#models_by_brand'
    get 'submodels/:model_id', to: 'submodels#submodels_by_model'
  end

  resources :cars
  resources :models
  resources :submodels
  resources :dealers
  resources :brands
end
