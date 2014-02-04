class AddImportantContentToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :important_link1, :string
    add_column :contacts, :important_link2, :string
    add_column :contacts, :important_link_title1, :string
    add_column :contacts, :important_link_title2, :string
    add_column :contacts, :important_link_description1, :text
    add_column :contacts, :important_link_description2, :text
  end
end
