class Model < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :submodels, dependent: :destroy
  belongs_to :brand
end
