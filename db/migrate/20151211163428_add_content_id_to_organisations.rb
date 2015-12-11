class AddContentIdToOrganisations < ActiveRecord::Migration
  def up
    add_column :organisations, :content_id, :string
  end

  def down
    remove_column :organisations, :content_id
  end
end
