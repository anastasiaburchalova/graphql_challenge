# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateFurnishingMutation, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation ($params: CreateFurnishingParams!) {
        createFurnishing (params: $params) {
          condition
          hasDishwasher
          hasWashingMashine
          property {
                  id
              }
        }
      }
    GQL
  end

  let(:input) do
    {
      params: {
        propertyId: property.id,
        condition: 'bad',
        hasDishwasher: true,
        hasWashingMashine: true
      }
    }
  end

  let(:property) { create(:property) }

  describe '.resolve' do
    let(:expected_result) do
      {
        'condition' => 'bad',
        'hasDishwasher' => true,
        'hasWashingMashine' => true,
        'property' => {
          'id' => property.id
        }

      }
    end

    it 'creates a furnishing' do
      expect { execute_graphql(mutation, variables: input) }.to change(Furnishing, :count).by(1)
    end

    it 'returns a furnishing' do
      result = execute_graphql(mutation, variables: input)
      data = result['data']['createFurnishing']

      expect(data >= expected_result).to be true
    end
  end
end
