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

ActiveRecord::Schema.define(version: 20130826122605) do

  create_table "contact_records", force: true do |t|
    t.integer  "contact_type_id"
    t.text     "description"
    t.text     "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.integer  "contact_form_links_count",    default: 0
    t.integer  "phone_numbers_count",         default: 0
    t.integer  "email_addresses_count",       default: 0
    t.integer  "post_addresses_count",        default: 0
    t.integer  "related_content_links_count", default: 0
    t.text     "contact_information"
    t.text     "more_info_website"
    t.text     "more_info_email_address"
    t.text     "more_info_post_address"
    t.text     "more_info_phone_number"
  end

  create_table "contacts", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_record_id"
    t.integer  "department_id"
  end

  add_index "contacts", ["contact_record_id"], name: "index_contacts_on_contact_record_id", using: :btree
  add_index "contacts", ["department_id"], name: "index_contacts_on_department_id", using: :btree

  create_table "email_addresses", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.string   "number"
    t.text     "description"
    t.text     "open_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "textphone"
    t.string   "international_phone"
    t.string   "fax"
  end

  add_index "phone_numbers", ["contact_record_id"], name: "index_phone_numbers_on_contact_record_id", using: :btree

  create_table "post_addresses", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_addresses", ["contact_record_id"], name: "index_post_addresses_on_contact_record_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.integer  "version"
    t.text     "permissions"
    t.boolean  "remotely_signed_out", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websites", force: true do |t|
    t.integer  "contact_record_id"
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "websites", ["contact_record_id"], name: "index_websites_on_contact_record_id", using: :btree
  add_index "websites", ["type"], name: "index_websites_on_type", using: :btree

end
