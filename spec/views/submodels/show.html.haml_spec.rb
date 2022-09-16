require 'rails_helper'

RSpec.describe "submodels/show", type: :view do
  before(:each) do
    @submodel = assign(:submodel, Submodel.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
