# frozen_string_literal: true

require 'rails_helper'

describe Valuation do
  describe 'associations' do
    it { is_expected.to belong_to :property }
  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:price_min).only_integer.is_greater_than_or_equal_to(0) }
  end
end
