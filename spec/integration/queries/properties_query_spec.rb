# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Properties query', type: :graphql do
  let(:query) do
    <<~GQL
      query  {
        properties  {
          bedrooms
          city
          id
          owner
          size
          valuation {
            id
            priceMin
            sellAfter
            sellBefore
          }
          furnishing {
            id
            condition
            hasDishwasher
            hasWashingMashine
          }
        }
      }
    GQL
  end

  let(:property) { create(:property) }
  let(:furnishing) { create(:furnishing, property: property) }
  let(:valuation) { create(:valuation, property: property) }

  before do
    furnishing
    valuation
  end

  describe '.resolve' do
    let(:expected_result) do
      [
        { 'bedrooms' => 0,
          'city' => property.city,
          'id' => property.id,
          'owner' => property.owner,
          'size' => property.size,
          'valuation' => {
            'id' => valuation.id, 'priceMin' => valuation.price_min, 'sellAfter' => valuation.sell_after.to_s,
            'sellBefore' => valuation.sell_before.to_s
          },
          'furnishing' => {
            'id' => furnishing.id, 'condition' => furnishing.condition, 'hasDishwasher' => furnishing.has_dishwasher,
            'hasWashingMashine' => furnishing.has_washing_mashine
          } }
      ]
    end

    it 'returns all properties' do
      result = execute_graphql(query)
      data = result['data']['properties']

      expect(data).to eq expected_result
    end
  end
end
