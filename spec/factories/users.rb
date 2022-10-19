FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "hello+#{n}@gmail.com" }
    password { SecureRandom.hex }
  end
end
