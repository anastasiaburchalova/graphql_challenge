# frozen_string_literal: true

module Types
  class CreateValuationParamsType < Types::BaseInputObject
    description 'Params to create a valuation for a property'

    argument :price_min, Integer, 'Owner can not sell below this price (cents)', required: false
    argument :property_id, Integer, 'Unique identifier of property', required: true
    argument :sell_after, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property after this date',
             required: false
    argument :sell_before, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property before this date',
             required: false
  end
end
