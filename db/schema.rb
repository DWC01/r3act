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

ActiveRecord::Schema.define(version: 20150628212321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ad_tags", force: :cascade do |t|
    t.string   "ad_type"
    t.string   "advertiser"
    t.string   "audience"
    t.string   "cost_basis"
    t.string   "client_cost"
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
    t.string   "total_cost"
    t.string   "unit_cost"
    t.string   "width"
    t.integer  "flight_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "avatars", force: :cascade do |t|
    t.string   "name"
    t.string   "mime_type"
    t.string   "s3_data"
    t.string   "original_url"
    t.string   "profile_url"
    t.string   "nav_url"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "backup_creatives", force: :cascade do |t|
    t.string   "name"
    t.string   "meta_data"
    t.string   "extension"
    t.string   "resource_url"
    t.string   "landing_page_url"
    t.string   "width"
    t.string   "height"
    t.string   "dimensions"
    t.string   "size"
    t.string   "mime_type"
    t.string   "etag"
    t.integer  "campaign_id"
    t.integer  "flight_id"
    t.integer  "creative_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "ad_sizes",                default: [], array: true
    t.string   "ad_tag_provider"
    t.string   "ad_tag_receivers",        default: [], array: true
    t.string   "ad_tag_sender"
    t.string   "ad_tags_count"
    t.string   "media_plan"
    t.string   "ad_devices",              default: [], array: true
    t.string   "ad_formats",              default: [], array: true
    t.string   "advertiser"
    t.string   "end_date"
    t.string   "media_plan_name"
    t.string   "name"
    t.string   "primary_target_audience"
    t.string   "start_date"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "description"
    t.text     "detailed_description"
    t.string   "founders"
    t.string   "month_founded"
    t.string   "year_founded"
    t.string   "aquired_by"
    t.string   "company_size"
    t.string   "status"
    t.string   "website_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "linkedin_url"
    t.string   "email_url"
    t.boolean  "media_agency"
    t.boolean  "ad_server"
    t.boolean  "creative_optimization"
    t.boolean  "verification"
    t.boolean  "measurement"
    t.boolean  "data_supplier"
    t.boolean  "data_management_platform"
    t.boolean  "demand_side_platform"
    t.boolean  "trade_desk"
    t.boolean  "media_buyer"
    t.boolean  "retargeting"
    t.boolean  "ad_exchange"
    t.boolean  "ad_network"
    t.boolean  "supply_side_platform"
    t.boolean  "publisher"
    t.boolean  "display"
    t.boolean  "mobile"
    t.boolean  "video"
    t.boolean  "social"
    t.string   "click_macro"
    t.string   "escaped_click_macro"
    t.string   "advertiser_id_macro"
    t.string   "ad_id_macro"
    t.string   "campaign_id_macro"
    t.string   "network_id_macro"
    t.string   "site_id_macro"
    t.string   "page_id_macro"
    t.string   "placement_id_macro"
    t.string   "creative_id_macro"
    t.string   "page_url_macro"
    t.string   "cachebuster_macro"
    t.text     "csv_header"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creatives", force: :cascade do |t|
    t.string   "name"
    t.string   "meta_data"
    t.string   "extension"
    t.string   "resource_url"
    t.string   "no_backup_img_url"
    t.string   "landing_page_url"
    t.string   "width"
    t.string   "height"
    t.string   "dimensions"
    t.string   "size"
    t.string   "mime_type"
    t.string   "creative_type"
    t.string   "compressed"
    t.string   "version"
    t.string   "bit_count"
    t.string   "swf_xmax"
    t.string   "swf_ymax"
    t.string   "frame_rate"
    t.string   "frame_count"
    t.string   "duration"
    t.string   "avm_version"
    t.string   "signature"
    t.string   "etag"
    t.integer  "flight_id"
    t.integer  "campaign_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string   "name"
    t.string   "adserver_cost"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "ad_tag_count"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "position"
    t.string   "title"
    t.string   "auth_token"
    t.string   "password_digest"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
