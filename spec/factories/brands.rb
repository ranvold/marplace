FactoryBot.define do
  factory :brand do
    name { 'bmw' }
  end

  factory :random_brand, class: 'Brand' do
    name { Faker::Vehicle.manufacture }
    description { Faker::Lorem.paragraph }
  end
end
