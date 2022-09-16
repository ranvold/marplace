require 'rails_helper'

RSpec.describe "submodels/new", type: :view do
  before(:each) do
    assign(:submodel, Submodel.new(
      name: "MyString"
    ))
  end

  it "renders new submodel form" do
    render

    assert_select "form[action=?][method=?]", submodels_path, "post" do

      assert_select "input[name=?]", "submodel[name]"
    end
  end
end
