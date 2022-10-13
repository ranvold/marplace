module API
  class Cars < Grape::API
    resource :cars do
      namespace :search do
        desc 'Returns a list of matching cars.'
        params do
          requires :query
        end
        get do
          search = Car.search(params[:query], fields: [:all_fields], misspellings: false)
        end
      end
    end
  end
end