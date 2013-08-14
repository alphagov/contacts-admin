class RenameClusterToContactGroup < ActiveRecord::Migration
  def change
    rename_column :contacts, :cluster_group_id, :contact_type_id
    change_column_null(:contacts, :contact_type_id, false)
  end
end
