class Dealer < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :sellers, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_validation :capitalize_name

  def capitalize_name
    self.name = name.capitalize.strip
  end
end
