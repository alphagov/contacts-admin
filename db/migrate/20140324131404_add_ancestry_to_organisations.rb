class AddAncestryToOrganisations < ActiveRecord::Migration
  def up
    add_column :organisations, :ancestry, :string
    add_index :organisations, :ancestry
  end

  def down
    remove_column :organisations, :ancestry, :string
    remove_index :organisations, :ancestry
  end
end
