class AddQuickLinksToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :quick_link_1, :string
    add_column :contacts, :quick_link_title_1, :string
    add_column :contacts, :quick_link_2, :string
    add_column :contacts, :quick_link_title_2, :string
    add_column :contacts, :quick_link_3, :string
    add_column :contacts, :quick_link_title_3, :string
  end
end
