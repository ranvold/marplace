class Dealer < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
