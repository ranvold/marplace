require 'rails_helper'

describe V1::Brands do
  let(:brand) { create :brand }

  describe 'GET /brands' do
    it 'returns success code' do
      get '/api/v1/brands'
      expect(response).to have_http_status(:ok)
    end

    it 'returns all brands' do
      brands = Brand.all
      get '/api/v1/brands'
      expect(JSON.parse(response.body)).to eq(JSON.parse(brands.to_json))
    end
  end

  describe 'GET /brands/:id' do
    let(:brand) { create :brand }

    it 'returns 404 for an invalid id' do
      get '/api/v1/brands/500'
      expect(response).to have_http_status(:not_found)
    end
  end
end
