class AddSlugToContactGroups < ActiveRecord::Migration
  def change
    add_column :contact_groups, :slug, :string
    add_index :contact_groups, :slug
  end
end
