class RenameMoreInfoWebsites < ActiveRecord::Migration
  def change
    rename_column :contacts, :more_info_website, :more_info_contact_form
  end
end
