# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreatePropertyMutation, type: :graphql do
  let(:mutation) do
    <<~GQL
      mutation ($params: CreatePropertyParams!) {
        createProperty (params: $params) {
          bedrooms
          city
          id
          owner
          size
          streetAddress
        }
      }
    GQL
  end

  let(:input) do
    {
      params: {
        city: 'Munich',
        owner: 'Alex',
        bedrooms: 1,
        streetAddress: 'Street 1'
      }
    }
  end

  describe '.resolve' do
    let(:expected_result) do
      {
        'city' => 'Munich',
        'owner' => 'Alex',
        'bedrooms' => 1,
        'streetAddress' => 'Street 1',
        'size' => nil
      }
    end

    it 'creates a property' do
      expect { execute_graphql(mutation, variables: input) }.to change(Property, :count).by(1)
    end

    it 'returns a property' do
      result = execute_graphql(mutation, variables: input)
      data = result['data']['createProperty']

      expect(data >= expected_result).to be true
    end
  end
end
