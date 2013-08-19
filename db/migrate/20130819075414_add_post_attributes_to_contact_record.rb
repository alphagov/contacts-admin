class AddPostAttributesToContactRecord < ActiveRecord::Migration
  def change
    add_column :contact_records, :post_name, :string
    add_column :contact_records, :post_text_head, :text
  end
end
