class AddTypeToWebsitesForSti < ActiveRecord::Migration
  def change
    add_column :websites, :type, :string

    add_index :websites, :type
  end
end
