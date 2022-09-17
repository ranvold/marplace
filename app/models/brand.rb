class Brand < ApplicationRecord
  has_many :models, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.select_brands
    brands = Brand.all

    brands_for_select = []

    brands.each do |brand|
      brands_for_select << [brand.name, brand.id]
    end

    return brands_for_select
  end
end
