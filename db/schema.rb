# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_23_102908) do

  create_table "contact_groups", charset: "utf8", force: :cascade do |t|
    t.integer "contact_group_type_id"
    t.string "title"
    t.string "description"
    t.integer "contacts_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.integer "organisation_id"
    t.index ["contact_group_type_id"], name: "index_contact_groups_on_contact_group_type_id"
    t.index ["organisation_id"], name: "index_contact_groups_on_organisation_id"
    t.index ["slug"], name: "index_contact_groups_on_slug"
  end

  create_table "contact_memberships", charset: "utf8", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "contact_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_relationships", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "related_contact_id", null: false
    t.index ["contact_id"], name: "index_contact_relationships_on_contact_id"
  end

  create_table "contacts", charset: "utf8", force: :cascade do |t|
    t.integer "contact_group_id"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_form_links_count", default: 0
    t.integer "phone_numbers_count", default: 0
    t.integer "email_addresses_count", default: 0
    t.integer "post_addresses_count", default: 0
    t.text "contact_information"
    t.text "more_info_contact_form"
    t.text "more_info_email_address"
    t.text "more_info_post_address"
    t.text "more_info_phone_number"
    t.string "slug"
    t.string "title"
    t.text "before_you_contact_us"
    t.string "quick_link_1"
    t.string "quick_link_title_1"
    t.string "quick_link_2"
    t.string "quick_link_title_2"
    t.string "quick_link_3"
    t.string "quick_link_title_3"
    t.integer "need_id"
    t.boolean "query_response_time", default: false
    t.integer "popularity", default: 0
    t.integer "organisation_id"
    t.string "content_id", limit: 36, null: false
    t.text "more_info_webchat"
    t.index ["need_id"], name: "index_contacts_on_need_id"
    t.index ["slug"], name: "index_contacts_on_slug"
  end

  create_table "email_addresses", charset: "utf8", force: :cascade do |t|
    t.integer "contact_id"
    t.string "title"
    t.text "description"
    t.string "email"
    t.string "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", charset: "utf8", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "organisations", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "format"
    t.string "slug"
    t.string "abbreviation"
    t.string "govuk_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ancestry"
    t.string "contact_index_content_id"
    t.string "content_id"
    t.index ["ancestry"], name: "index_organisations_on_ancestry"
    t.index ["slug"], name: "index_organisations_on_slug", unique: true
  end

  create_table "phone_numbers", charset: "utf8", force: :cascade do |t|
    t.integer "contact_id"
    t.string "title"
    t.string "number"
    t.text "description"
    t.text "open_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "textphone"
    t.string "international_phone"
    t.string "fax"
    t.string "number_options_path"
    t.string "international_number_options_path"
    t.text "best_time_to_call"
    t.index ["contact_id"], name: "index_phone_numbers_on_contact_id"
  end

  create_table "post_addresses", charset: "utf8", force: :cascade do |t|
    t.integer "contact_id"
    t.string "title"
    t.text "description"
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "street_address"
    t.string "locality"
    t.string "region"
    t.string "postal_code"
    t.string "world_location_slug"
    t.integer "contact_type_id"
    t.decimal "latitude", precision: 10
    t.decimal "longitude", precision: 10
    t.index ["contact_id"], name: "index_post_addresses_on_contact_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "uid"
    t.integer "version"
    t.text "permissions"
    t.boolean "remotely_signed_out", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "organisation_slug"
    t.string "organisation_content_id"
    t.boolean "disabled", default: false
  end

  create_table "versions", charset: "utf8", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.string "user_name"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "websites", charset: "utf8", force: :cascade do |t|
    t.integer "contact_id"
    t.string "title"
    t.text "description"
    t.string "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.index ["contact_id"], name: "index_websites_on_contact_id"
    t.index ["type"], name: "index_websites_on_type"
  end

end
