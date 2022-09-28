module API
  class Brands < Grape::API
    resource :brands do
      desc 'Return all brands'
      get do
        Brand.all
      end

      desc 'Show a brand'
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          Brand.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          error!('Record Not Found', 404)
        end
      end

      desc 'Create a brand'
      params do
        requires :name, type: String
        optional :description, type: String
      end
      post do
        brand = Brand.create!(
          name: params[:name],
          description: params[:description]
        )
      end

      desc 'Update a brand'
      route_param :id do
        put do
          Brand.find(params[:id]).update(params)
          { message: 'Brand updated successfully' }
        rescue ActiveRecord::RecordNotFound
          error!('Record Not Found', 404)
        end 
      end

      desc 'Destroy a brand'
      route_param :id do
        delete do
          brand = Brand.find(params[:id])
          brand.destroy
          { message: 'Brand deleted successfully' }
        rescue ActiveRecord::RecordNotFound
          error!('Record Not Found', 404)
        end
      end
    end
  end
end