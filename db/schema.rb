# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_410_102_912) do
  create_table 'furnishings', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'property_id'
    t.string 'condition', null: false
    t.boolean 'has_washing_mashine', default: false, null: false
    t.boolean 'has_dishwasher', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['property_id'], name: 'index_furnishings_on_property_id'
  end

  create_table 'properties', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.string 'owner', null: false
    t.string 'city', null: false
    t.string 'street_address', null: false
    t.integer 'bedrooms', default: 0, null: false
    t.decimal 'size', precision: 10
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city'], name: 'index_properties_on_city'
  end

  create_table 'valuations', charset: 'utf8mb4', collation: 'utf8mb4_0900_ai_ci', force: :cascade do |t|
    t.bigint 'property_id'
    t.date 'sell_before'
    t.date 'sell_after'
    t.integer 'price_min'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['property_id'], name: 'index_valuations_on_property_id'
  end
end
