class AddDepartmentIdToContactGroups < ActiveRecord::Migration
  def change
    add_column :contact_groups, :department_id, :integer
    add_index :contact_groups, :department_id
  end
end
