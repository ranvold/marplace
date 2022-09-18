class Model < ApplicationRecord
  has_many :cars
  belongs_to :brand
end
