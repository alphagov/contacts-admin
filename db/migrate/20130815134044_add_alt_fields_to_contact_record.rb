class AddAltFieldsToContactRecord < ActiveRecord::Migration
  def change
    add_column :contact_records, :alt_meta_title, :string
    add_column :contact_records, :alt_meta_description, :string
    add_column :contact_records, :alt_meta_keywords, :string
  end
end
