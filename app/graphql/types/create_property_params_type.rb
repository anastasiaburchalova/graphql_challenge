# frozen_string_literal: true

module Types
  class CreatePropertyParamsType < Types::BaseInputObject
    description 'Params to create a new property'

    argument :bedrooms, Integer, 'Amount of bedrooms', required: true
    argument :city, String, 'Location (city)', required: true
    argument :owner, String, 'Contact and name of the owner', required: true
    argument :size, Float, 'Property size in square meters', required: false
    argument :street_address, String, 'Street name and house number', required: true
  end
end
