# frozen_string_literal: true

FactoryBot.define do
  factory :furnishing do
    condition { Furnishing.conditions.values.sample }
    has_washing_mashine { [true, false].sample }
    has_dishwasher { [true, false].sample }

    property
  end
end
