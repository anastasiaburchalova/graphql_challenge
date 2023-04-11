# frozen_string_literal: true

module Types
  class ValuationType < Types::BaseObject
    description 'Information about property selling'

    field :id, Integer, 'Unique identifier', null: false
    field :price_min, Integer, 'Owner can not sell below this price (cents)', null: true
    field :sell_after, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property after this date', null: true
    field :sell_before, GraphQL::Types::ISO8601Date, 'Owner wants to sell the property before this date', null: true

    field :property, Types::PropertyType, 'Related property', null: false
  end
end
