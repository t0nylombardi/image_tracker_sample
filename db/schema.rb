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

ActiveRecord::Schema.define(version: 20161122191155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "click_events", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "campaign"
    t.string   "banner_size"
    t.string   "station"
    t.string   "city"
    t.string   "state"
    t.string   "user_agent"
    t.string   "referral"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "crawlers", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "browser_type"
    t.boolean  "is_it_a_bot"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "access_path"
  end

  create_table "pixels", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "campaign"
    t.string   "station"
    t.datetime "created_at",  null: false
    t.string   "city"
    t.string   "state"
    t.string   "user_agent"
    t.string   "referral"
    t.string   "banner_size"
  end

  add_index "pixels", ["id"], name: "pixels_id_ix", using: :btree

end
