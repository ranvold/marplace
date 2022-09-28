module API
  class Endpoint < Grape::API
    version 'v1'
    format :json

    mount API::Brands
  end
end