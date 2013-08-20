class AddCounterCachesOnContactRecord < ActiveRecord::Migration
  def change
    add_column :contact_records, :websites_count, :integer, default: 0
    add_column :contact_records, :numbers_count, :integer, default: 0
    add_column :contact_records, :email_addresses_count, :integer, default: 0
    add_column :contact_records, :post_addresses_count, :integer, default: 0
  end
end
