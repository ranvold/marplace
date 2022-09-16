class CreateSubmodels < ActiveRecord::Migration[7.0]
  def change
    create_table :submodels do |t|
      t.string :name

      t.timestamps
    end
  end
end
