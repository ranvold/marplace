require 'rails_helper'

RSpec.describe Car, type: :model do
  it { is_expected.to belong_to(:model) }
  it { is_expected.to belong_to(:dealer) }
  it { is_expected.to have_many(:favorites).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:favorites) }
  it { is_expected.to have_many_attached(:images) }
  it { is_expected.to define_enum_for(:fuel_type) }
  it { is_expected.to define_enum_for(:body_color) }
  it { is_expected.to define_enum_for(:gearbox) }
end
