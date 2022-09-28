module API
  class Brands < Grape::API
    resource :brands do
      desc 'Returns all brands'
      get do
        Brand.all
      end
    end
  end
end