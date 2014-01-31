class MakeContactsBelongToHmrc < ActiveRecord::Migration
  def up
    Contact.update_all department_id: "hm-revenue-customs"
    ContactGroup.update_all department_id: "hm-revenue-customs"
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
