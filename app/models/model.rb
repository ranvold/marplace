class Model < ApplicationRecord
  has_many :cars
  has_many :submodels, dependent: :destroy
  belongs_to :brand
end
