# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141228215204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_tags", force: true do |t|
    t.string   "target"
    t.string   "media_partner"
    t.string   "placement_name"
    t.string   "ad_type"
    t.string   "ad_type_details"
    t.string   "product"
    t.string   "size"
    t.string   "width"
    t.string   "height"
    t.string   "device"
    t.string   "unit_cost"
    t.string   "impressions"
    t.string   "total_cost"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "flight_dates"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "audience"
    t.string   "flight"
    t.string   "total_digital_cost"
  end

  create_table "campaigns", force: true do |t|
    t.string   "name"
    t.string   "ad_tags_file"
    t.string   "ad_tags_count"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "placement_sizes"
    t.string   "display_types"
    t.string   "ad_tag_provider"
    t.string   "ad_tag_sender"
    t.string   "ad_tag_receivers", default: [], array: true
    t.string   "advertiser_name"
    t.string   "media_plan_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
