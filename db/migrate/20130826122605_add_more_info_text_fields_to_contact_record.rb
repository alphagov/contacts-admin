class AddMoreInfoTextFieldsToContactRecord < ActiveRecord::Migration
  def change
    drop_table :more_info_records

    add_column :contact_records, :more_info_website, :text
    add_column :contact_records, :more_info_email_address, :text
    add_column :contact_records, :more_info_post_address, :text
    add_column :contact_records, :more_info_phone_number, :text
  end
end
