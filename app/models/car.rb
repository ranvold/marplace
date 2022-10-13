class Car < ApplicationRecord
  belongs_to :model
  belongs_to :dealer
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many_attached :images

  searchkick
  after_commit :reindex

  enum :fuel_type, { gasoline: 0, diesel: 1, electric: 2, lpg: 3 }
  enum :body_color, { black: 0, white: 1, gray: 2, silver: 3, red: 4, blue: 5 }
  enum :gearbox, { automatic: 0, semiautomatic: 1, mechanic: 2 }

  def self.car_name(car, submodel_id)
    concat_name = ("#{car.model.brand.name} #{car.model.name}")

    if !submodel_id.nil?
      concat_name += (" #{Submodel.find(submodel_id).name}")
    end
    
    return concat_name
  end

  def search_data
    {
      all_fields: [name, fuel_type, body_color, gearbox].compact.join(' ')
    }
  end
end
