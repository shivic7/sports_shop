# spec/factories/products.rb
FactoryBot.define do

  factory :admin_user do
    name { "Admin User" }
    sequence(:email) { |n| "admin#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    role {'super_admin'}
  end

  factory :customer do
    name { "Customer" }
    sequence(:email) { |n| "customer#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :product do
    name { "Bicycle" }
    description { "A nice bicycle" }
    base_price { 100.0 }
  end

  factory :part do
    name { "Frame" }
    category { "frame_type" }
    price { 50.0 }
    stock { 10 }
  end

  factory :combination do
    condition_part { create(:part, category: 'wheels', name: 'Mountain Wheels') }
    affected_part { create(:part, category: 'frame_type', name: 'Full Suspension') }
    allowed { true }
    additional_price { 10.0 }
  end
end
