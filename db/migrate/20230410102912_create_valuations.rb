# frozen_string_literal: true

class CreateValuations < ActiveRecord::Migration[7.0]
  def change
    create_table :valuations do |t|
      t.belongs_to :property, index: true

      t.date :sell_before
      t.date :sell_after
      t.integer :price_min

      t.timestamps
    end
  end
end
