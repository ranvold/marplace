require 'rails_helper'

RSpec.describe Dealer, type: :model do

  it 'has a unique name' do
    dealer1 = create(:dealer)
    dealer2 = build(:dealer)
    expect(dealer2).not_to be_valid
  end
end
