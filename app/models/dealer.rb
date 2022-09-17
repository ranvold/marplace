class Dealer < ApplicationRecord
  has_many :cars, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def self.select_dealers
    dealers = Dealer.all

    dealers_for_select = []

    dealers.each do |dealer|
      dealers_for_select << [dealer.name, dealer.id]
    end

    return dealers_for_select
  end
end
