require 'rails_helper'

RSpec.describe "dealers/index", type: :view do
  before(:each) do
    assign(:dealers, [
      Dealer.create!(
        name: "Name"
      ),
      Dealer.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of dealers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
