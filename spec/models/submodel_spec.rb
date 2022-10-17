require 'rails_helper'

RSpec.describe Submodel, type: :model do
  it { is_expected.to belong_to(:model) }
  it { is_expected.to validate_presence_of(:name) }
end
