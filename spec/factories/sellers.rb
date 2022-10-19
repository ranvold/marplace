FactoryBot.define do
  factory :seller do
    sequence(:email) { |n| "hello+#{n}@gmail.com" }
    password { SecureRandom.hex }
    dealer
  end
end
