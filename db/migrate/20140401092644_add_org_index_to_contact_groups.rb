class AddOrgIndexToContactGroups < ActiveRecord::Migration
  def change
    add_index :contact_groups, :organisation_id
  end
end
