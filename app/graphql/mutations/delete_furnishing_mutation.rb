# frozen_string_literal: true

module Mutations
  class DeleteFurnishingMutation < BaseMutation
    argument :id, Integer, 'Unique identifier of a furnishing', required: true

    type Types::FurnishingType

    def resolve(id:)
      Furnishing.find(id)&.destroy
    end
  end
end
