# frozen_string_literal: true

class Property < ApplicationRecord
  has_one :valuation, dependent: :destroy
  has_one :furnishing, dependent: :destroy

  validates :owner, presence: true, length: { maximum: 255 }
  validates :city, presence: true, length: { maximum: 255 }
  validates :street_address, presence: true, length: { maximum: 255 }
  validates :bedrooms, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than_or_equal_to: 0 }
end
