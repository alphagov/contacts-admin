class RemoveImportantLinks < ActiveRecord::Migration
  def change
    remove_column :contacts, :important_link1
    remove_column :contacts, :important_link2
    remove_column :contacts, :important_link_title1
    remove_column :contacts, :important_link_title2
    remove_column :contacts, :important_link_description1
    remove_column :contacts, :important_link_description2
  end
end
