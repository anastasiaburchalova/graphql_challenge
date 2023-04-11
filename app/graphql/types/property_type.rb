# frozen_string_literal: true

module Types
  class PropertyType < Types::BaseObject
    description 'Available properties to be sold'

    field :bedrooms, Integer, 'Amount of bedrooms', null: false
    field :city, String, 'Location (city)', null: false
    field :owner, String, 'Contact and name of the owner', null: false
    field :street_address, String, 'Street name and house number', null: false
  end
end
