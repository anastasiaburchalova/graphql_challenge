# frozen_string_literal: true

module Types
  class PropertyParamsType < Types::BaseInputObject
    description 'Filtering params. Non-null params are compared for equality: <property.attr> == <value>'

    argument :bedrooms, Integer, 'Amount of bedrooms', required: false
    argument :city, String, 'Location (city)', required: false
    argument :id, Integer, 'Unique identifier', required: false
    argument :owner, String, 'Contact and name of the owner', required: false
    argument :size, Float, 'Property size in square meters', required: false
    argument :street_address, String, 'Street name and house number', required: false
  end
end
