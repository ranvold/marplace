class Dealer < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :sellers, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
