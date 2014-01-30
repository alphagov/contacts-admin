class RemoveDepartments < ActiveRecord::Migration
  def up
    drop_table :departments
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
