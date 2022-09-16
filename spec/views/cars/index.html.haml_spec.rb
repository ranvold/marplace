require 'rails_helper'

RSpec.describe "cars/index", type: :view do
  before(:each) do
    assign(:cars, [
      Car.create!(
        name: "Name",
        fueltype: "Fueltype",
        bodycolor: "Bodycolor",
        gearbox: "Gearbox",
        price: 2.5,
        model: nil,
        dealer: nil
      ),
      Car.create!(
        name: "Name",
        fueltype: "Fueltype",
        bodycolor: "Bodycolor",
        gearbox: "Gearbox",
        price: 2.5,
        model: nil,
        dealer: nil
      )
    ])
  end

  it "renders a list of cars" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Fueltype".to_s, count: 2
    assert_select "tr>td", text: "Bodycolor".to_s, count: 2
    assert_select "tr>td", text: "Gearbox".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
