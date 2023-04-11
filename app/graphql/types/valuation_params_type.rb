# frozen_string_literal: true

module Types
  class ValuationParamsType < Types::BaseInputObject
    description 'Filtering params. Non-null params are compared for equality: <valuation.attr> == <value>'

    argument :id, Integer, 'Unique identifier', required: false
    argument :price_min, Integer, 'Owner can not sell below this price (cents)', required: false
    argument :sell_after, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property after this date',
             required: false
    argument :sell_before, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property before this date',
             required: false
  end
end
