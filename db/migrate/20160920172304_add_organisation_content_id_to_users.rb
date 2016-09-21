class AddOrganisationContentIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :organisation_content_id, :string
    add_column :users, :disabled, :boolean, default: false
  end
end
