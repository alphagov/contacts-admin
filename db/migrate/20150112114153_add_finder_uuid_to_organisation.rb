class AddFinderUUIDToOrganisation < ActiveRecord::Migration

  def up
    add_column :organisations, :contact_index_content_id, :string

    Organisation.reset_column_information

    Organisation.all.each do |org|
      org.update(contact_index_content_id: SecureRandom.uuid)
      puts "added contact_index_content_id to #{org.title}"
    end
  end

  def down
    remove_column :organisations, :contact_index_content_id
  end
end
