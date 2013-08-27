class RenameContactsToOffices < ActiveRecord::Migration
  def change
    rename_table :contacts, :offices
  end
end
