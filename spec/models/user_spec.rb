require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:favorites).dependent(:destroy) }
  it { is_expected.to have_many(:cars).through(:favorites) }
end
