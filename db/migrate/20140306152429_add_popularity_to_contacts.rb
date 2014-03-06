class AddPopularityToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :popularity, :integer, default: 0
  end
end
