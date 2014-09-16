class AddContentIdToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :content_id, :string, limit: 36
    Contact.all.each do |contact|
      contact.update_column :content_id, SecureRandom.uuid
    end
    change_column :contacts, :content_id, :string, limit: 36, null: false
  end

  def down
    remove_column :contacts, :content_id
  end
end
