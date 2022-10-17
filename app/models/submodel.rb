class Submodel < ApplicationRecord
  belongs_to :model
  validates :name, presence: true
end
