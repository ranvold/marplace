require 'rails_helper'

RSpec.describe "dealers/edit", type: :view do
  before(:each) do
    @dealer = assign(:dealer, Dealer.create!(
      name: "MyString"
    ))
  end

  it "renders the edit dealer form" do
    render

    assert_select "form[action=?][method=?]", dealer_path(@dealer), "post" do

      assert_select "input[name=?]", "dealer[name]"
    end
  end
end
