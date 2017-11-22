FactoryBot.define do
  factory :profile do
    user
  end

  factory :category do
    name "Example"
  end

  factory :product do
    name "test"
    category
    calories_per_100 100
  end

  factory :meal do
    product
    user
    meal_type "lunch"
    quantity 123
  end

  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    password "password"
  end
end
