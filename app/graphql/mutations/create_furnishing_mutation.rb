# frozen_string_literal: true

module Mutations
  class CreateFurnishingMutation < BaseMutation
    argument :params, Types::CreateFurnishingParamsType, 'Params for creation', required: true

    type Types::FurnishingType

    def resolve(params:)
      params = params.to_kwargs
      property_id = params.delete(:property_id)
      Property.find(property_id).create_furnishing!(params)
    end
  end
end
