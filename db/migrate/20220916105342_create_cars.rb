class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :fueltype
      t.string :bodycolor
      t.string :gearbox
      t.float :price
      t.references :model, null: false, foreign_key: true
      t.references :dealer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
