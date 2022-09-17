class Model < ApplicationRecord
  has_many :cars
  belongs_to :brand

  def self.select_models
    models = Model.all

    models_for_select = []

    models.each do |model|
      models_for_select << [model.name, model.id]
    end

    return models_for_select
  end
end
