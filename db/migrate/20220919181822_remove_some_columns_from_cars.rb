class RemoveSomeColumnsFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :fueltype, :string
    remove_column :cars, :bodycolor, :string
    remove_column :cars, :gearbox, :string
  end
end
