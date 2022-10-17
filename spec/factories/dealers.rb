FactoryBot.define do
  factory :dealer do
    name { 'spaceway' }
  end

  factory :random_dealer, class: 'Dealer' do
    name { Faker::Name.last_name }
    description { Faker::Lorem.paragraph }
  end
end
