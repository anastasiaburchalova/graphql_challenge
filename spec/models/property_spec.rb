# frozen_string_literal: true

require 'rails_helper'

describe Property do
  describe 'associations' do
    it { is_expected.to have_one :valuation }
    it { is_expected.to have_one :furnishing }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :owner }
    it { is_expected.to validate_length_of(:owner).is_at_most(255) }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_length_of(:city).is_at_most(255) }
    it { is_expected.to validate_presence_of :street_address }
    it { is_expected.to validate_length_of(:street_address).is_at_most(255) }
    it { is_expected.to validate_numericality_of(:bedrooms).only_integer.is_greater_than_or_equal_to(0) }
  end
end
