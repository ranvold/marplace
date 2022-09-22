class AddDealerToSellers < ActiveRecord::Migration[7.0]
  def change
    add_reference :sellers, :dealer, null: false, foreign_key: true
  end
end
