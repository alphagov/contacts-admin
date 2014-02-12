class AddUserNeedIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :need_id, :integer
    add_index :contacts, :need_id
  end
end
