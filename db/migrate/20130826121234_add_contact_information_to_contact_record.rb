class AddContactInformationToContactRecord < ActiveRecord::Migration
  def change
    add_column :contact_records, :contact_information, :text
  end
end
