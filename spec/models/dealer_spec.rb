require 'rails_helper'

RSpec.describe Dealer, type: :model do
  it { is_expected.to have_many(:cars).dependent(:destroy) }
  it { is_expected.to have_many(:sellers).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
