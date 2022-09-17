class RemoveSubmodelFromModels < ActiveRecord::Migration[7.0]
  def change
    remove_reference :models, :submodel, null: true, foreign_key: true, index:true
  end
end
