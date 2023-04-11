# frozen_string_literal: true

module Types
  class FurnishingType < Types::BaseObject
    description 'Property housing and furniture information'

    field :condition, Types::FurnishingCondition, 'How used is the furniture and housing', null: false
    field :has_dishwasher, Boolean, 'Dishwasher exists', null: false
    field :has_washing_mashine, Boolean, 'Washing mashine exists', null: false
    field :id, Integer, 'Unique identifier', null: false

    field :property, Types::PropertyType, 'Related property', null: false
  end
end
