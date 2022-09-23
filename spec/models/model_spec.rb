require 'rails_helper'

RSpec.describe Model, type: :model do

  it "has a fill name" do
    model = build(:model, name: "")
    expect(model).to_not be_valid
  end

end
