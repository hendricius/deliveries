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

ActiveRecord::Schema.define(version: 20150424213900) do

  create_table "companies", force: :cascade do |t|
    t.string   "email",               null: false
    t.string   "address"
    t.string   "contact_person_name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.integer  "company_id"
    t.string   "address"
    t.integer  "max_capacity"
    t.integer  "current_capacity"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "auth_token"
  end

  create_table "orders", force: :cascade do |t|
    t.text     "content"
    t.integer  "driver_id"
    t.integer  "company_id"
    t.float    "from_latitude"
    t.float    "from_longitude"
    t.string   "from_address"
    t.float    "to_latitude"
    t.float    "to_longitude"
    t.string   "to_address"
    t.integer  "capacity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tours", force: :cascade do |t|
    t.text     "tour"
    t.text     "capacityarray"
    t.integer  "time"
    t.integer  "driver_id"
    t.integer  "kind"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
