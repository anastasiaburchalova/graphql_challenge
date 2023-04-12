# frozen_string_literal: true

FactoryBot.define do
  factory :valuation do
    sell_before { Faker::Time.forward(days: 30) }
    sell_after { Time.zone.today }
    price_min { Faker::Number.between(from: 1, to: 1_000_000_000) }

    property
  end
end
