require 'rails_helper'

RSpec.describe Dealer, type: :model do
  it 'validate presence of name' do
    dealer = build(:dealer, name: '')

    expect(dealer).not_to be_valid
  end

  it 'validate uniqueness of name' do
    dealer_1 = create(:dealer, name: 'spaceway')
    dealer_2 = build(:dealer, name: 'spaceway')

    expect(dealer_2).not_to be_valid
  end

  it 'is expected to be capitalize name' do
    dealer = create(:dealer, name: 'spaceway')

    expect(dealer.name).to eq('Spaceway')
  end

  it { is_expected.to have_many(:cars).dependent(:destroy) }
  it { is_expected.to have_many(:sellers).dependent(:destroy) }
end
