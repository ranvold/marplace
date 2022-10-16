module V1
  class Cars < Grape::API
    resource :cars do
      desc 'Return all cars'
      get do
        Rails.cache.fetch('cars', expires_in: 1.hour) do
          Car.all
        end
      end

      namespace :search do
        params do
          requires :query
        end
        desc 'Returns a list of matching cars.'
        get do
          Rails.cache.fetch("cars/search?query=#{params[:query]}", expires_in: 1.hour) do
            Car.search(params[:query], fields: [:all_fields], misspellings: false)
          end
        end
      end
    end
  end
end
