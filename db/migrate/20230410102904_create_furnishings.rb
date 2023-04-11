# frozen_string_literal: true

class CreateFurnishings < ActiveRecord::Migration[7.0]
  def change
    create_table :furnishings do |t|
      t.belongs_to :property, index: true

      t.string :condition, null: false
      t.boolean :has_washing_mashine, null: false, default: false
      t.boolean :has_dishwasher, null: false, default: false

      t.timestamps
    end
  end
end
