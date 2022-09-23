class Brand < ApplicationRecord
  has_many :models, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_validation :normalize_name

  def normalize_name
    self.name = self.name.downcase.strip
  end
end
