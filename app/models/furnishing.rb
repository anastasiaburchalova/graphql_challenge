# frozen_string_literal: true

class Furnishing < ApplicationRecord
  CONDITIONS = %i[bad below_average average good perfect].freeze

  belongs_to :property

  enum :condition, CONDITIONS.index_with(&:to_s), prefix: true

  validates :has_washing_mashine, inclusion: [true, false]
  validates :has_dishwasher, inclusion: [true, false]
end
