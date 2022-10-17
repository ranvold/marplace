class Model < ApplicationRecord
  belongs_to :brand
  has_many :cars, dependent: :destroy
  has_many :submodels, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
