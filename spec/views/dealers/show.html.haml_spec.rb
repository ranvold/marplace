require 'rails_helper'

RSpec.describe "dealers/show", type: :view do
  before(:each) do
    @dealer = assign(:dealer, Dealer.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
