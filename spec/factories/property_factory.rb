# frozen_string_literal: true

FactoryBot.define do
  factory :property do
    owner { Faker::Name.name }
    city { Faker::Address.city }
    bedrooms { rand(5) }
    street_address { Faker::Address.street_address }
    size { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
