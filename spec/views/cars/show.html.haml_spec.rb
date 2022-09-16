require 'rails_helper'

RSpec.describe "cars/show", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      name: "Name",
      fueltype: "Fueltype",
      bodycolor: "Bodycolor",
      gearbox: "Gearbox",
      price: 2.5,
      model: nil,
      dealer: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Fueltype/)
    expect(rendered).to match(/Bodycolor/)
    expect(rendered).to match(/Gearbox/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
