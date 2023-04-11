# frozen_string_literal: true

class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :owner, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.integer :bedrooms, null: false, default: 0
      t.decimal :size

      t.index :city
      t.timestamps
    end
  end
end
