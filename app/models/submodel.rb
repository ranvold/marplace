class Submodel < ApplicationRecord
  belongs_to :model
  validates :name, presence: true
  before_validation :normalize_name

  def normalize_name
    self.name = name.downcase.strip
  end
end
