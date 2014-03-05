namespace :contacts do
  desc "Import contact data from CSV file"
  task import_hmrc: :environment do
    raise ArgumentError.new("Please provide contact file path using environment variable DATA_FILE") if ENV['DATA_FILE'].blank?

    ImportContacts.new(ENV['DATA_FILE']).import
  end

  desc "Index Contacts in rummager"
  task index: :environment do
    index = Contact.index_for_search
    RUMMAGER_INDEX.add_batch index
    RUMMAGER_INDEX.commit
  end

  desc "Crude implementation of splitting the address"
  task split_address: :environment do
    PostAddress.all.to_a.each do |address|
      strings = address.address.split("\n")
      address.title = strings[0]
      address.street_address = strings[1]
      address.locality = strings[2]
      address.region = strings[3]
      address.postal_code = strings[4]
      address.world_location_slug = "united-kingdom"
      if strings.length > 5
        address.description = strings[5..-1].join("\n")
      end
      address.save(validate: false)
    end
  end

  desc "remap contact memberships"
  task remap_memberships: :environment do
    Contact.where("contact_group_id IS NOT NULL").to_a.each do |contact|
      ContactMembership.create contact_id: contact.id, contact_group_id: contact.contact_group_id
    end
  end
end
