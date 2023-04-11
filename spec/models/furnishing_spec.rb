# frozen_string_literal: true

require 'rails_helper'

describe Furnishing do
  describe 'associations' do
    subject(:furnishing) { described_class.new }

    it { is_expected.to belong_to :property }

    it do
      expect(furnishing).to define_enum_for(:condition)
        .with_values(
          bad: 'bad', below_average: 'below_average', average: 'average', good: 'good', perfect: 'perfect'
        )
        .backed_by_column_of_type(:string).with_prefix
    end
  end
end
