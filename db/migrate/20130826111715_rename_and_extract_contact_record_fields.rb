class RenameAndExtractContactRecordFields < ActiveRecord::Migration
  def change
    rename_column :contact_records, :alt_meta_title, :meta_title
    rename_column :contact_records, :alt_meta_description, :meta_description
    remove_column :contact_records, :alt_meta_keywords, :text

    remove_column :contact_records, :textphone
    remove_column :contact_records, :international_phone
    remove_column :contact_records, :fax

    add_column :phone_numbers, :textphone, :string
    add_column :phone_numbers, :international_phone, :string
    add_column :phone_numbers, :fax, :string
  end
end
