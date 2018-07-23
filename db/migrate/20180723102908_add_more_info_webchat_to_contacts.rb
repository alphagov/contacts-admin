class AddMoreInfoWebchatToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :more_info_webchat, :text
  end
end
