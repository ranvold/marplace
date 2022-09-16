require 'rails_helper'

RSpec.describe "cars/edit", type: :view do
  before(:each) do
    @car = assign(:car, Car.create!(
      name: "MyString",
      fueltype: "MyString",
      bodycolor: "MyString",
      gearbox: "MyString",
      price: 1.5,
      model: nil,
      dealer: nil
    ))
  end

  it "renders the edit car form" do
    render

    assert_select "form[action=?][method=?]", car_path(@car), "post" do

      assert_select "input[name=?]", "car[name]"

      assert_select "input[name=?]", "car[fueltype]"

      assert_select "input[name=?]", "car[bodycolor]"

      assert_select "input[name=?]", "car[gearbox]"

      assert_select "input[name=?]", "car[price]"

      assert_select "input[name=?]", "car[model_id]"

      assert_select "input[name=?]", "car[dealer_id]"
    end
  end
end
