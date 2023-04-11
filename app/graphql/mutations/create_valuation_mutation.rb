# frozen_string_literal: true

module Mutations
  class CreateValuationMutation < BaseMutation
    argument :params, Types::CreateValuationParamsType, 'Params for creation', required: true

    type Types::ValuationType

    def resolve(params:)
      params = params.to_kwargs
      property_id = params.delete(:property_id)
      Property.find(property_id).create_valuation!(params)
    end
  end
end
