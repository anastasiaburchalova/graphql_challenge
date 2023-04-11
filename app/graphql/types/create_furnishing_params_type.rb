# frozen_string_literal: true

module Types
  class CreateFurnishingParamsType < Types::BaseInputObject
    description 'Params to create a new furnishing'

    argument :condition, Types::FurnishingCondition, 'How used is the furniture and housing', required: false,
                                                                                              default_value: 'average'
    argument :has_dishwasher, Boolean, 'Dishwasher exists', required: false
    argument :has_washing_mashine, Boolean, 'Washing mashine exists', required: false
    argument :property_id, Integer, 'Unique identifier of a property', required: true
  end
end
