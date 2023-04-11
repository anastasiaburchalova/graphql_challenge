# frozen_string_literal: true

class Valuation < ApplicationRecord
  belongs_to :property

  validates :price_min, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
