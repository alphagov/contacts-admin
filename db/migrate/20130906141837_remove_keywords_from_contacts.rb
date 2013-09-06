class RemoveKeywordsFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :keywords
  end
end
