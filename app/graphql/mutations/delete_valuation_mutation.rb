# frozen_string_literal: true

module Mutations
  class DeleteValuationMutation < BaseMutation
    argument :id, Integer, 'Unique identifier of a valuation', required: true

    type Types::ValuationType

    def resolve(id:)
      Valuation.find(id)&.destroy
    end
  end
end
