# frozen_string_literal: true

module Mutations
  class DeletePropertyMutation < BaseMutation
    argument :id, Integer, 'Unique identifier of a property', required: true

    type Types::PropertyType

    def resolve(id:)
      Property.find(id)&.destroy
    end
  end
end
