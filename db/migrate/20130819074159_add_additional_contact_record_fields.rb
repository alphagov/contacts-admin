class AddAdditionalContactRecordFields < ActiveRecord::Migration
  def up
    add_column :contact_records, :textphone, :string
    add_column :contact_records, :international_phone, :string
    add_column :contact_records, :fax, :string

    remove_column :email_addresses, :more_info
    remove_column :numbers, :more_info
    remove_column :post_addresses, :more_info
    remove_column :websites, :more_info
  end

  def down
    remove_column :contact_records, :textphone
    remove_column :contact_records, :international_phone
    remove_column :contact_records, :fax

    add_column :email_addresses, :more_info, :text
    add_column :numbers, :more_info, :text
    add_column :post_addresses, :more_info, :text
    add_column :websites, :more_info, :text
  end
end
