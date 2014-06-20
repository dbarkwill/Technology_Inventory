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

ActiveRecord::Schema.define(version: 20140620140252) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_id"
  end

  create_table "attr_devices", force: true do |t|
    t.integer  "attr_id"
    t.integer  "device_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attrs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_group_id"
    t.string   "type"
    t.string   "values"
    t.string   "unit"
  end

  create_table "device_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "asset_tag"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_group_id"
  end

  create_table "networks", force: true do |t|
    t.string   "name"
    t.string   "network"
    t.integer  "vlan"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
