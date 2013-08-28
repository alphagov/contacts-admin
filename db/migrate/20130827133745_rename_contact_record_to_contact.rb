class RenameContactRecordToContact < ActiveRecord::Migration
  def change
    rename_table :contact_records, :contacts

    rename_column :email_addresses, :contact_record_id, :contact_id
    rename_column :offices, :contact_record_id, :contact_id
    rename_column :phone_numbers, :contact_record_id, :contact_id
    rename_column :post_addresses, :contact_record_id, :contact_id
    rename_column :websites, :contact_record_id, :contact_id
  end
end
