# frozen_string_literal: true

module Types
  class FurnishingCondition < Types::BaseEnum
    description 'Enum describing how used the furnishing of the property is'

    value 'bad', 'Old furniture that requires renovation'
    value 'below_average', 'With scratches or other time marks'
    value 'average', 'Normal condition, a little worn out'
    value 'good', 'Almost brand new'
    value 'perfect', 'Brand new'
  end
end
