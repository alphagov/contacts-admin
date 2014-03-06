class AddQueryResponseTimeAttributeToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :query_response_time, :boolean, default: false
  end
end
