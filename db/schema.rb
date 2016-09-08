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

ActiveRecord::Schema.define(version: 20160420132844) do

  create_table "contact_groups", force: :cascade do |t|
    t.integer  "contact_group_type_id", limit: 4
    t.string   "title",                 limit: 255
    t.string   "description",           limit: 255
    t.integer  "contacts_count",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                  limit: 255
    t.integer  "organisation_id",       limit: 4
  end

  add_index "contact_groups", ["contact_group_type_id"], name: "index_contact_groups_on_contact_group_type_id", using: :btree
  add_index "contact_groups", ["organisation_id"], name: "index_contact_groups_on_organisation_id", using: :btree
  add_index "contact_groups", ["slug"], name: "index_contact_groups_on_slug", using: :btree

  create_table "contact_memberships", force: :cascade do |t|
    t.integer  "contact_id",       limit: 4
    t.integer  "contact_group_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_relationships", id: false, force: :cascade do |t|
    t.integer "contact_id",         limit: 4, null: false
    t.integer "related_contact_id", limit: 4, null: false
  end

  add_index "contact_relationships", ["contact_id"], name: "index_contact_relationships_on_contact_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "contact_group_id",         limit: 4
    t.text     "description",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_form_links_count", limit: 4,     default: 0
    t.integer  "phone_numbers_count",      limit: 4,     default: 0
    t.integer  "email_addresses_count",    limit: 4,     default: 0
    t.integer  "post_addresses_count",     limit: 4,     default: 0
    t.text     "contact_information",      limit: 65535
    t.text     "more_info_contact_form",   limit: 65535
    t.text     "more_info_email_address",  limit: 65535
    t.text     "more_info_post_address",   limit: 65535
    t.text     "more_info_phone_number",   limit: 65535
    t.string   "slug",                     limit: 255
    t.string   "title",                    limit: 255
    t.text     "before_you_contact_us",    limit: 65535
    t.string   "quick_link_1",             limit: 255
    t.string   "quick_link_title_1",       limit: 255
    t.string   "quick_link_2",             limit: 255
    t.string   "quick_link_title_2",       limit: 255
    t.string   "quick_link_3",             limit: 255
    t.string   "quick_link_title_3",       limit: 255
    t.integer  "need_id",                  limit: 4
    t.boolean  "query_response_time",                    default: false
    t.integer  "popularity",               limit: 4,     default: 0
    t.integer  "organisation_id",          limit: 4
    t.string   "content_id",               limit: 36,                    null: false
  end

  add_index "contacts", ["need_id"], name: "index_contacts_on_need_id", using: :btree
  add_index "contacts", ["slug"], name: "index_contacts_on_slug", using: :btree

  create_table "email_addresses", force: :cascade do |t|
    t.integer  "contact_id",  limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "email",       limit: 255
    t.string   "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "organisations", force: :cascade do |t|
    t.string   "title",                    limit: 255
    t.string   "format",                   limit: 255
    t.string   "slug",                     limit: 255
    t.string   "abbreviation",             limit: 255
    t.string   "govuk_status",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry",                 limit: 255
    t.string   "contact_index_content_id", limit: 255
    t.string   "content_id",               limit: 255
  end

  add_index "organisations", ["ancestry"], name: "index_organisations_on_ancestry", using: :btree
  add_index "organisations", ["slug"], name: "index_organisations_on_slug", unique: true, using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "contact_id",                        limit: 4
    t.string   "title",                             limit: 255
    t.string   "number",                            limit: 255
    t.text     "description",                       limit: 65535
    t.text     "open_hours",                        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "textphone",                         limit: 255
    t.string   "international_phone",               limit: 255
    t.string   "fax",                               limit: 255
    t.string   "number_options_path",               limit: 255
    t.string   "international_number_options_path", limit: 255
    t.text     "best_time_to_call",                 limit: 65535
  end

  add_index "phone_numbers", ["contact_id"], name: "index_phone_numbers_on_contact_id", using: :btree

  create_table "post_addresses", force: :cascade do |t|
    t.integer  "contact_id",          limit: 4
    t.string   "title",               limit: 255
    t.text     "description",         limit: 65535
    t.text     "address",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "street_address",      limit: 65535
    t.string   "locality",            limit: 255
    t.string   "region",              limit: 255
    t.string   "postal_code",         limit: 255
    t.string   "world_location_slug", limit: 255
    t.integer  "contact_type_id",     limit: 4
    t.decimal  "latitude",                          precision: 10
    t.decimal  "longitude",                         precision: 10
  end

  add_index "post_addresses", ["contact_id"], name: "index_post_addresses_on_contact_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "email",               limit: 255
    t.string   "uid",                 limit: 255
    t.integer  "version",             limit: 4
    t.text     "permissions",         limit: 65535
    t.boolean  "remotely_signed_out",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation_slug",   limit: 255
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,   null: false
    t.integer  "item_id",        limit: 4,     null: false
    t.string   "event",          limit: 255,   null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 65535
    t.datetime "created_at"
    t.string   "user_name",      limit: 255
    t.text     "object_changes", limit: 65535
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "websites", force: :cascade do |t|
    t.integer  "contact_id",  limit: 4
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.string   "link",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",        limit: 255
  end

  add_index "websites", ["contact_id"], name: "index_websites_on_contact_id", using: :btree
  add_index "websites", ["type"], name: "index_websites_on_type", using: :btree

end
