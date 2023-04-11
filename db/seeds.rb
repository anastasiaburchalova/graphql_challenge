# frozen_string_literal: true

require 'faker'

COUNT = 5
BOOLEANS = [true, false].freeze

(1..COUNT).each do |n|
  property = Property.create!(
    owner: Faker::Name.name,
    city: Faker::Address.city,
    street_address: Faker::Address.street_address,
    bedrooms: rand(5),
    size: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )

  Furnishing.create!(
    property: property,
    condition: Furnishing.conditions.values.sample,
    has_washing_mashine: BOOLEANS.sample,
    has_dishwasher: BOOLEANS.sample
  )

  # Timeframe of selling can be optional
  sell_before = (n % 3).zero? ? Faker::Time.forward(days: 30) : nil
  sell_after = sell_before && (sell_before - Faker::Number.digit.days)

  Valuation.create!(
    property: property,
    sell_before: sell_before,
    sell_after: sell_after,
    price_min: Faker::Number.between(from: 1, to: 1_000_000_000)
  )
end
