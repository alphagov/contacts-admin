class AddContentIdToContacts < ActiveRecord::Migration
  # In the real class, `content_id` is read-only, so we have to cheat
  class Contact < ActiveRecord::Base; end

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
