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

ActiveRecord::Schema.define(version: 20150112114153) do

  create_table "contact_groups", force: true do |t|
    t.integer  "contact_group_type_id"
    t.string   "title"
    t.string   "description"
    t.integer  "contacts_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "organisation_id"
  end

  add_index "contact_groups", ["contact_group_type_id"], name: "index_contact_groups_on_contact_group_type_id", using: :btree
  add_index "contact_groups", ["organisation_id"], name: "index_contact_groups_on_organisation_id", using: :btree
  add_index "contact_groups", ["slug"], name: "index_contact_groups_on_slug", using: :btree

  create_table "contact_memberships", force: true do |t|
    t.integer  "contact_id"
    t.integer  "contact_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_relationships", id: false, force: true do |t|
    t.integer "contact_id",         null: false
    t.integer "related_contact_id", null: false
  end

  add_index "contact_relationships", ["contact_id"], name: "index_contact_relationships_on_contact_id", using: :btree

  create_table "contacts", force: true do |t|
    t.integer  "contact_group_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_form_links_count",            default: 0
    t.integer  "phone_numbers_count",                 default: 0
    t.integer  "email_addresses_count",               default: 0
    t.integer  "post_addresses_count",                default: 0
    t.text     "contact_information"
    t.text     "more_info_contact_form"
    t.text     "more_info_email_address"
    t.text     "more_info_post_address"
    t.text     "more_info_phone_number"
    t.string   "slug"
    t.string   "title"
    t.text     "before_you_contact_us"
    t.string   "quick_link_1"
    t.string   "quick_link_title_1"
    t.string   "quick_link_2"
    t.string   "quick_link_title_2"
    t.string   "quick_link_3"
    t.string   "quick_link_title_3"
    t.integer  "need_id"
    t.boolean  "query_response_time",                 default: false
    t.integer  "popularity",                          default: 0
    t.integer  "organisation_id"
    t.string   "content_id",               limit: 36,                 null: false
  end

  add_index "contacts", ["need_id"], name: "index_contacts_on_need_id", using: :btree
  add_index "contacts", ["slug"], name: "index_contacts_on_slug", using: :btree

  create_table "email_addresses", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.string   "email"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "organisations", force: true do |t|
    t.string   "title"
    t.string   "format"
    t.string   "slug"
    t.string   "abbreviation"
    t.string   "govuk_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.string   "contact_index_content_id"
  end

  add_index "organisations", ["ancestry"], name: "index_organisations_on_ancestry", using: :btree

  create_table "phone_numbers", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.string   "number"
    t.text     "description"
    t.text     "open_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "textphone"
    t.string   "international_phone"
    t.string   "fax"
    t.string   "number_options_path"
    t.string   "international_number_options_path"
    t.text     "best_time_to_call"
  end

  add_index "phone_numbers", ["contact_id"], name: "index_phone_numbers_on_contact_id", using: :btree

  create_table "post_addresses", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "street_address"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "world_location_slug"
    t.integer  "contact_type_id"
    t.decimal  "latitude",            precision: 10, scale: 0
    t.decimal  "longitude",           precision: 10, scale: 0
  end

  add_index "post_addresses", ["contact_id"], name: "index_post_addresses_on_contact_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.integer  "version"
    t.text     "permissions"
    t.boolean  "remotely_signed_out", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation_slug"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.string   "user_name"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "websites", force: true do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  add_index "websites", ["contact_id"], name: "index_websites_on_contact_id", using: :btree
  add_index "websites", ["type"], name: "index_websites_on_type", using: :btree

end
