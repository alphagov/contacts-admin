class RenameAndExtractContactRecordFields < ActiveRecord::Migration
  def change
    rename_column :contact_records, :alt_meta_title, :meta_title
    rename_column :contact_records, :alt_meta_description, :meta_description
    remove_column :contact_records, :alt_meta_keywords
  end
end
