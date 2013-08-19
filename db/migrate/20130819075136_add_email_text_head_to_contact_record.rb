class AddEmailTextHeadToContactRecord < ActiveRecord::Migration
  def change
    add_column :contact_records, :email_text_head, :text
  end
end
