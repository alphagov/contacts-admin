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

ActiveRecord::Schema.define(version: 20130814110403) do

  create_table "contacts", force: true do |t|
    t.string   "title"
    t.integer  "contact_type_id",  null: false
    t.text     "description"
    t.text     "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contact_form_url"
  end

  add_index "contacts", ["contact_type_id"], name: "index_contacts_on_contact_type_id", using: :btree

  create_table "email_addresses", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.string   "link"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "numbers", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.string   "number"
    t.string   "international_number"
    t.text     "description"
    t.text     "open_hours"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "numbers", ["contact_id"], name: "index_numbers_on_contact_id", using: :btree

  create_table "post_addresses", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.text     "address"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_addresses", ["contact_id"], name: "index_post_addresses_on_contact_id", using: :btree

  create_table "websites", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["contact_id"], name: "index_websites_on_contact_id", using: :btree

end
