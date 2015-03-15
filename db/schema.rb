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

ActiveRecord::Schema.define(version: 20150315024812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_tags", force: true do |t|
    t.string   "ad_type"
    t.string   "advertiser"
    t.string   "audience"
    t.string   "cost_basis"
    t.string   "cost_method"
    t.string   "days"
    t.string   "details"
    t.string   "device"
    t.string   "end_date"
    t.string   "format"
    t.string   "height"
    t.string   "impressions"
    t.string   "javascript_tag"
    t.string   "publisher"
    t.string   "media_plan_name"
    t.string   "placement"
    t.string   "primary_target_audience"
    t.string   "product"
    t.string   "properties"
    t.string   "size"
    t.string   "site"
    t.string   "start_action"
    t.string   "start_date"
    t.string   "unit_cost"
    t.string   "width"
    t.integer  "flight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.string   "ad_sizes",                default: [], array: true
    t.string   "ad_tag_provider"
    t.string   "ad_tag_receivers",        default: [], array: true
    t.string   "ad_tag_sender"
    t.string   "ad_tags_count"
    t.string   "ad_tags_file"
    t.string   "ad_devices",              default: [], array: true
    t.string   "ad_formats",              default: [], array: true
    t.string   "advertiser"
    t.string   "end_date"
    t.string   "media_plan_name"
    t.string   "name"
    t.string   "primary_target_audience"
    t.string   "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "name"
    t.string   "adserver_cost"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "ad_tag_count"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
