require 'rails_helper'

RSpec.describe "submodels/index", type: :view do
  before(:each) do
    assign(:submodels, [
      Submodel.create!(
        name: "Name"
      ),
      Submodel.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of submodels" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
