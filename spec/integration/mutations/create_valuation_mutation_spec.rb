# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateValuationMutation, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation ($params: CreateValuationParams!) {
        createValuation (params: $params) {
          id
          priceMin
          property { id }
          sellAfter
          sellBefore
        }
      }
    GQL
  end

  let(:input) do
    {
      params: {
        propertyId: property.id
      }
    }
  end

  let(:property) { create(:property) }

  describe '.resolve' do
    let(:expected_result) do
      {
        'priceMin' => nil,
        'property' => {
          'id' => property.id
        },
        'sellAfter' => nil,
        'sellBefore' => nil
      }
    end

    it 'creates a valuation' do
      expect { execute_graphql(mutation, variables: input) }.to change(Valuation, :count).by(1)
    end

    it 'returns a property' do
      result = execute_graphql(mutation, variables: input)
      data = result['data']['createValuation']

      expect(data >= expected_result).to be true
    end
  end
end
