require 'rails_helper'

RSpec.describe Brand, type: :model do
  it 'validate presence of name' do
    brand = build(:brand, name: '')

    expect(brand).not_to be_valid
  end

  it 'validate uniqueness of name' do
    brand_1 = create(:brand, name: 'bmw')
    brand_2 = build(:brand, name: 'bmw')

    expect(brand_2).not_to be_valid
  end

  it 'is expected to be upcase name' do
    brand = create(:brand, name: 'bmw')

    expect(brand.name).to eq('BMW')
  end

  it { is_expected.to have_many(:models).dependent(:destroy) }
end
