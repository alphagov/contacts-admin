class RemoveExcessiveFieldsOnContactRecord < ActiveRecord::Migration
  def change
    remove_column :contact_records, :email_text_head, :text
    remove_column :contact_records, :post_name, :string
    remove_column :contact_records, :post_text_head, :text
  end
end
