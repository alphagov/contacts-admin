class RemoveQuickLinkDescAndTransactionFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :quick_link_description_1
    remove_column :contacts, :quick_link_description_2
    remove_column :contacts, :quick_link_description_3
    remove_column :contacts, :online_transaction_link
    remove_column :contacts, :online_transaction_description
  end
end
