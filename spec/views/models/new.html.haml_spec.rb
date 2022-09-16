require 'rails_helper'

RSpec.describe "models/new", type: :view do
  before(:each) do
    assign(:model, Model.new(
      name: "MyString",
      description: "MyText",
      brand: nil,
      submodel: nil
    ))
  end

  it "renders new model form" do
    render

    assert_select "form[action=?][method=?]", models_path, "post" do

      assert_select "input[name=?]", "model[name]"

      assert_select "textarea[name=?]", "model[description]"

      assert_select "input[name=?]", "model[brand_id]"

      assert_select "input[name=?]", "model[submodel_id]"
    end
  end
end
