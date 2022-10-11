class Submodel < ApplicationRecord
  belongs_to :model
  validates :name, presence: true, uniqueness: true
  before_validation :normalize_name

  def normalize_name
    self.name = self.name.downcase.strip
  end
end
