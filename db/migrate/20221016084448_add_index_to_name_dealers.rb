class AddIndexToNameDealers < ActiveRecord::Migration[7.0]
  def change
    add_index :dealers, :name, unique: true
  end
end
