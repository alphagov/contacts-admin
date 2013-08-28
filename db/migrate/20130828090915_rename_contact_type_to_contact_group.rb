class RenameContactTypeToContactGroup < ActiveRecord::Migration
  def change
    rename_column :contacts, :contact_type_id, :contact_group_id
  end
end
