require 'rails_helper'

RSpec.describe Brand, type: :model do
  
  it "has a unique name" do
    brand1 = create(:brand, name: "BMW")
    brand2 = build(:brand, name: "bmw")
    expect(brand2).to_not be_valid
  end

end
