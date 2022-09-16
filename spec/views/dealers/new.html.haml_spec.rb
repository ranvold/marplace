require 'rails_helper'

RSpec.describe "dealers/new", type: :view do
  before(:each) do
    assign(:dealer, Dealer.new(
      name: "MyString"
    ))
  end

  it "renders new dealer form" do
    render

    assert_select "form[action=?][method=?]", dealers_path, "post" do

      assert_select "input[name=?]", "dealer[name]"
    end
  end
end
