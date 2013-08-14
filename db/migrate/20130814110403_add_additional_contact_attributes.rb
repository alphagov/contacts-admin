class AddAdditionalContactAttributes < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_form_url, :text
  end
end
