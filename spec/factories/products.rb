FactoryBot.define do
  factory :product do
    user { association :user }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price.to_i }
    category { Faker::Commerce.department(max: 1) }
    image { nil }
    is_active { false }
  end
end
