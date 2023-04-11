# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    description 'A list of possible mutations'

    field :create_furnishing, mutation: Mutations::CreateFurnishingMutation, description: 'Create new furnishing'
    field :create_property, mutation: Mutations::CreatePropertyMutation, description: 'Create new property'
    field :create_valuation, mutation: Mutations::CreateValuationMutation, description: 'Create new valuation'
    field :delete_furnishing, mutation: Mutations::DeleteFurnishingMutation, description: 'Delete a furnishing'
    field :delete_property, description: 'Delete a property, its valuation and furnishing',
                            mutation: Mutations::DeletePropertyMutation
    field :delete_valuation, mutation: Mutations::DeleteValuationMutation, description:  'Delete a valuation'
  end
end
