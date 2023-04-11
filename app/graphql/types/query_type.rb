# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    description 'A list of queries which may be executed'

    field :properties,
          [Types::PropertyType],
          null: false,
          description: 'Return all properties'

    def properties
      Property.all
    end
  end
end
