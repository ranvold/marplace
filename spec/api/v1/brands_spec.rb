require 'rails_helper'

describe V1::Brands do
  it 'returns success code' do
    get '/api/v1/brands'
    expect(response).to have_http_status(:ok)
  end

  it 'returns a brand by id' do
    brand = create(:brand)
    get "/api/v1/brands/#{brand.id}"
    expect(JSON.parse(response.body)).to eq(JSON.parse(brand.to_json))
  end

  it 'returns not found for an invalid id' do
    get '/api/v1/brands/500'
    expect(response).to have_http_status(:not_found)
  end
end
