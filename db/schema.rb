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

ActiveRecord::Schema.define(version: 20140428033219) do

  create_table "photos", force: true do |t|
    t.string   "title",                       null: false
    t.string   "image"
    t.string   "description"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tweet"
    t.boolean  "allowed",     default: false
  end

  add_index "photos", ["position"], name: "index_photos_on_position", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id",      null: false
    t.string   "uid",          null: false
    t.string   "provider",     null: false
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "image"
    t.string   "location"
    t.string   "description"
    t.string   "token_access"
    t.string   "token_secret"
    t.text     "raw_info"
    t.text     "urls"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["uid", "provider"], name: "index_profiles_on_uid_and_provider", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "nombres",                    null: false
    t.string   "email"
    t.string   "imagen_url"
    t.boolean  "admin",      default: false
    t.boolean  "banned",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
