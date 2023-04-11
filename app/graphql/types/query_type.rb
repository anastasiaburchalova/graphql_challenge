# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    description 'A list of queries which may be executed'

    field :properties,
          [Types::PropertyType],
          null: false,
          description: 'Return all properties'

    field :valuations,
          [Types::ValuationType],
          null: false,
          description: 'Return all valuations'

    field :furnishings,
          [Types::FurnishingType],
          null: false,
          description: 'Return all furnishings'

    # TODO: add pagination
    def properties
      Property.all
    end

    def valuations
      Valuation.all
    end

    def furnishings
      Furnishing.all
    end
  end
end
