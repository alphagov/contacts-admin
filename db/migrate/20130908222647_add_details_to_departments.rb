class AddDetailsToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :logo_name, :string
  end
end
