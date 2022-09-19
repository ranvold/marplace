class AddSomeColumnsToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :fuel_type, :integer, default: 0
    add_column :cars, :body_color, :integer, default: 0
    add_column :cars, :gearbox, :integer, default: 0
  end
end
