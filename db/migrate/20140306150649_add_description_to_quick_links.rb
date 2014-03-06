class AddDescriptionToQuickLinks < ActiveRecord::Migration
  def change
    add_column :contacts, :quick_link_description_1, :string
    add_column :contacts, :quick_link_description_2, :string
    add_column :contacts, :quick_link_description_3, :string
  end
end
