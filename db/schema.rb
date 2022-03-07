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

ActiveRecord::Schema[6.1].define(version: 20180723102908) do

  create_table "contact_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_group_type_id"
    t.string   "title"
    t.string   "description"
    t.integer  "contacts_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "organisation_id"
    t.index ["contact_group_type_id"], name: "index_contact_groups_on_contact_group_type_id", using: :btree
    t.index ["organisation_id"], name: "index_contact_groups_on_organisation_id", using: :btree
    t.index ["slug"], name: "index_contact_groups_on_slug", using: :btree
  end

  create_table "contact_memberships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.integer  "contact_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_relationships", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "contact_id",         null: false
    t.integer "related_contact_id", null: false
    t.index ["contact_id"], name: "index_contact_relationships_on_contact_id", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_group_id"
    t.text     "description",              limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_form_links_count",               default: 0
    t.integer  "phone_numbers_count",                    default: 0
    t.integer  "email_addresses_count",                  default: 0
    t.integer  "post_addresses_count",                   default: 0
    t.text     "contact_information",      limit: 65535
    t.text     "more_info_contact_form",   limit: 65535
    t.text     "more_info_email_address",  limit: 65535
    t.text     "more_info_post_address",   limit: 65535
    t.text     "more_info_phone_number",   limit: 65535
    t.string   "slug"
    t.string   "title"
    t.text     "before_you_contact_us",    limit: 65535
    t.string   "quick_link_1"
    t.string   "quick_link_title_1"
    t.string   "quick_link_2"
    t.string   "quick_link_title_2"
    t.string   "quick_link_3"
    t.string   "quick_link_title_3"
    t.integer  "need_id"
    t.boolean  "query_response_time",                    default: false
    t.integer  "popularity",                             default: 0
    t.integer  "organisation_id"
    t.string   "content_id",               limit: 36,                    null: false
    t.text     "more_info_webchat",        limit: 65535
    t.index ["need_id"], name: "index_contacts_on_need_id", using: :btree
    t.index ["slug"], name: "index_contacts_on_slug", using: :btree
  end

  create_table "email_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "email"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "organisations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.string   "format"
    t.string   "slug"
    t.string   "abbreviation"
    t.string   "govuk_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.string   "contact_index_content_id"
    t.string   "content_id"
    t.index ["ancestry"], name: "index_organisations_on_ancestry", using: :btree
    t.index ["slug"], name: "index_organisations_on_slug", unique: true, using: :btree
  end

  create_table "phone_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.string   "number"
    t.text     "description",                       limit: 65535
    t.text     "open_hours",                        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "textphone"
    t.string   "international_phone"
    t.string   "fax"
    t.string   "number_options_path"
    t.string   "international_number_options_path"
    t.text     "best_time_to_call",                 limit: 65535
    t.index ["contact_id"], name: "index_phone_numbers_on_contact_id", using: :btree
  end

  create_table "post_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description",         limit: 65535
    t.text     "address",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "street_address",      limit: 65535
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "world_location_slug"
    t.integer  "contact_type_id"
    t.decimal  "latitude",                          precision: 10
    t.decimal  "longitude",                         precision: 10
    t.index ["contact_id"], name: "index_post_addresses_on_contact_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.integer  "version"
    t.text     "permissions",             limit: 65535
    t.boolean  "remotely_signed_out",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organisation_slug"
    t.string   "organisation_content_id"
    t.boolean  "disabled",                              default: false
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "item_type",                    null: false
    t.integer  "item_id",                      null: false
    t.string   "event",                        null: false
    t.string   "whodunnit"
    t.text     "object",         limit: 65535
    t.datetime "created_at"
    t.string   "user_name"
    t.text     "object_changes", limit: 65535
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  create_table "websites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contact_id"
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.index ["contact_id"], name: "index_websites_on_contact_id", using: :btree
    t.index ["type"], name: "index_websites_on_type", using: :btree
  end

end
