FactoryBot.define do
  
  factory :dealer do
    name { "Spaceway" }
  end

  factory :brand do
    name { "BMW" }
  end

  factory :model do
    name { "4 series" }
    description { "" }
    association :brand
  end

end