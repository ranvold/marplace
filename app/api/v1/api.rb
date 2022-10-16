module V1
  class API < Grape::API
    version 'v1'
    format :json

    mount V1::Brands
    mount V1::Cars
  end
end
