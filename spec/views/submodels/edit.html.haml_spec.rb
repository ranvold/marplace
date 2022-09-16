require 'rails_helper'

RSpec.describe "submodels/edit", type: :view do
  before(:each) do
    @submodel = assign(:submodel, Submodel.create!(
      name: "MyString"
    ))
  end

  it "renders the edit submodel form" do
    render

    assert_select "form[action=?][method=?]", submodel_path(@submodel), "post" do

      assert_select "input[name=?]", "submodel[name]"
    end
  end
end
