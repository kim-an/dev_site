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

ActiveRecord::Schema.define(version: 20160920220540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string   "html_file"
    t.integer  "width"
    t.integer  "height"
    t.integer  "campaign_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "ads", ["campaign_id"], name: "index_ads_on_campaign_id", using: :btree

  create_table "agencies", force: :cascade do |t|
    t.string   "business_name"
    t.date     "founded_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "campaign_name"
    t.date     "launch_date"
    t.integer  "client_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "campaigns", ["client_id"], name: "index_campaigns_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "business_name"
    t.string   "point_of_contact"
    t.integer  "agency_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "password_digest"
  end

  add_index "clients", ["agency_id"], name: "index_clients_on_agency_id", using: :btree

  add_foreign_key "ads", "campaigns"
  add_foreign_key "campaigns", "clients"
  add_foreign_key "clients", "agencies"
end
