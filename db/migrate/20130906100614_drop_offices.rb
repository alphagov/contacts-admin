class DropOffices < ActiveRecord::Migration
  def change
    drop_table :offices

    rename_column :questions, :office_id, :contact_id

    add_column :contacts, :department_id, :integer
    add_index :contacts, :department_id
  end
end
