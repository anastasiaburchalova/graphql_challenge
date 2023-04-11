# frozen_string_literal: true

module Mutations
  class CreatePropertyMutation < BaseMutation
    argument :params, Types::CreatePropertyParamsType, 'Params for creation', required: true

    type Types::PropertyType

    def resolve(params:)
      Property.create!(params.to_kwargs)
    end
  end
end
