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

ActiveRecord::Schema.define(version: 20140630205536) do

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "network_id"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "summary"
  end

  create_table "attr_devices", force: true do |t|
    t.integer  "attr_id"
    t.integer  "device_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attrs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "device_group_id"
    t.string   "style"
    t.text     "values"
    t.string   "unit"
  end

  create_table "checkout_histories", force: true do |t|
    t.integer  "device_id"
    t.string   "name"
    t.text     "notes"
    t.boolean  "checked_in"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "checkedout"
  end

  create_table "links", force: true do |t|
    t.integer  "article_id"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "logs", force: true do |t|
    t.text     "message"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", force: true do |t|
    t.string   "name"
    t.string   "network"
    t.integer  "vlan"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["article_id"], name: "index_taggings_on_article_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
