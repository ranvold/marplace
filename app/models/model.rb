class Model < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :submodels, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  belongs_to :brand
  before_validation :normalize_name

  def normalize_name
    self.name = self.name.capitalize.strip
  end
end
