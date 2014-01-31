class ChangeDepartmentForeignKeys < ActiveRecord::Migration
  def up
    change_column :contact_groups, :department_id, :string
    change_column :contacts, :department_id, :string
  end
  def down
    change_column :contact_groups, :department_id, :integer
    change_column :contacts, :department_id, :integer
  end
end
