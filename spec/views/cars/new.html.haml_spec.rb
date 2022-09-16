require 'rails_helper'

RSpec.describe "cars/new", type: :view do
  before(:each) do
    assign(:car, Car.new(
      name: "MyString",
      fueltype: "MyString",
      bodycolor: "MyString",
      gearbox: "MyString",
      price: 1.5,
      model: nil,
      dealer: nil
    ))
  end

  it "renders new car form" do
    render

    assert_select "form[action=?][method=?]", cars_path, "post" do

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
