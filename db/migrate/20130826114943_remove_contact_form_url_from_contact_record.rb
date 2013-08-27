class RemoveContactFormUrlFromContactRecord < ActiveRecord::Migration
  def change
    remove_column :contact_records, :contact_form_url, :text
  end
end
