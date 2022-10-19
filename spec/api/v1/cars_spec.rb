require 'rails_helper'

describe V1::Cars do
  it 'returns success code' do
    get '/api/v1/cars'
    expect(response).to have_http_status(:ok)
  end

  it 'returns all cars' do
    bmw_4 = create(:model)
    spaceway = create(:dealer, name: 'Spaceway')
    overprice = create(:dealer, name: 'Overprice')
    create(:car, name: 'BMW 4 series 435', model: bmw_4, dealer: spaceway)
    create(:car, name: 'BMW 4 series 430', model: bmw_4, dealer: overprice)

    get '/api/v1/cars'
    expect(JSON.parse(response.body)).to eq(JSON.parse(Car.all.to_json))
  end
end
