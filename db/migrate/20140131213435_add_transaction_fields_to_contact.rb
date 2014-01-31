class AddTransactionFieldsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :online_transaction_description, :text
    add_column :contacts, :online_transaction_link, :string
  end
end
