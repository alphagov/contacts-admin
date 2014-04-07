class RemoveParentOrgIdFromOrg < ActiveRecord::Migration
  def change
    remove_column :organisations, :parent_organisation, :string
  end
end
