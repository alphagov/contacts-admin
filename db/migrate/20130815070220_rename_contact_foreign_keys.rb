class RenameContactForeignKeys < ActiveRecord::Migration
  def change
    rename_column :email_addresses, :contact_id, :contact_record_id
    rename_column :numbers, :contact_id, :contact_record_id
    rename_column :post_addresses, :contact_id, :contact_record_id
    rename_column :websites, :contact_id, :contact_record_id
  end
end
