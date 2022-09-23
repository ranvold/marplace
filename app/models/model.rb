class Model < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :submodels, dependent: :destroy
  validates :name, presence: true
  belongs_to :brand
end
