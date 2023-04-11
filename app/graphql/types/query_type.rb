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

    field :property,
          Types::PropertyType,
          null: true,
          description: 'Find a property' do
      argument :params, Types::PropertyParamsType, 'Search params', required: true
    end

    field :valuation,
          Types::ValuationType,
          null: true,
          description: 'Find a valuation' do
      argument :params, Types::ValuationParamsType, 'Search params', required: true
    end

    field :furnishing,
          Types::FurnishingType,
          null: true,
          description: 'Find a furnishing' do
      argument :params, Types::FurnishingParamsType, 'Search params', required: true
    end

    def properties
      Property.all
    end

    def valuations
      Valuation.all
    end

    def furnishings
      Furnishing.all
    end

    def property(params:)
      Services::SingleRecordResolver.new(params: params, entity_klass: Property).call
    end

    def valuation(params:)
      Services::SingleRecordResolver.new(params: params, entity_klass: Valuation).call
    end

    def furnishing(params:)
      Services::SingleRecordResolver.new(params: params, entity_klass: Furnishing).call
    end
  end
end
