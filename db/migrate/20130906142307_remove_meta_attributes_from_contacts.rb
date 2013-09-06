class RemoveMetaAttributesFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :meta_title
    remove_column :contacts, :meta_description
  end
end
