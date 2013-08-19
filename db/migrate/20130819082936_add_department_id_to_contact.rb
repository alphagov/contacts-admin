class AddDepartmentIdToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :department_id, :integer

    add_index :contacts, :department_id
  end
end
