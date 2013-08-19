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

ActiveRecord::Schema.define(version: 20130815141843) do

  create_table "contact_records", force: true do |t|
    t.integer  "contact_type_id"
    t.text     "description"
    t.text     "keywords"
    t.text     "contact_form_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alt_meta_title"
    t.string   "alt_meta_description"
    t.string   "alt_meta_keywords"
  end

  create_table "contacts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_record_id"
  end

  add_index "contacts", ["contact_record_id"], name: "index_contacts_on_contact_record_id", using: :btree

  create_table "email_addresses", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.string   "link"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "more_info_records", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "type"
    t.text     "heading"
    t.text     "title"
    t.text     "description"
    t.text     "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "more_info_records", ["contact_record_id"], name: "index_more_info_records_on_contact_record_id", using: :btree
  add_index "more_info_records", ["type"], name: "index_more_info_records_on_type", using: :btree

  create_table "numbers", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.string   "number"
    t.string   "international_number"
    t.text     "description"
    t.text     "open_hours"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "numbers", ["contact_record_id"], name: "index_numbers_on_contact_record_id", using: :btree

  create_table "post_addresses", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.text     "address"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_addresses", ["contact_record_id"], name: "index_post_addresses_on_contact_record_id", using: :btree

  create_table "websites", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.text     "more_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "websites", ["contact_record_id"], name: "index_websites_on_contact_record_id", using: :btree

end
