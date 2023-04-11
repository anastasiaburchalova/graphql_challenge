# frozen_string_literal: true

module Types
  class FurnishingParamsType < Types::BaseInputObject
    description 'Filtering params. Non-null params are compared for equality: <furnishing.attr> == <value>'

    argument :condition, Types::FurnishingCondition, 'How used is the furniture and housing', required: false
    argument :has_dishwasher, Boolean, 'Dishwasher exists', required: false
    argument :has_washing_mashine, Boolean, 'Washing mashine exists', required: false
    argument :id, Integer, 'Unique identifier', required: false
  end
end
