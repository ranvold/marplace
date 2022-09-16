require 'rails_helper'

RSpec.describe "models/show", type: :view do
  before(:each) do
    @model = assign(:model, Model.create!(
      name: "Name",
      description: "MyText",
      brand: nil,
      submodel: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
