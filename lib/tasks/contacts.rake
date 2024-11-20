namespace :contacts do
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
      address.description = strings[5..].join("\n") if strings.length > 5
      address.save!(validate: false)
    end
  end

  desc "remap contact memberships"
  task remap_memberships: :environment do
    Contact.where("contact_group_id IS NOT NULL").to_a.each do |contact|
      ContactMembership.create contact_id: contact.id, contact_group_id: contact.contact_group_id
    end
  end

  desc "Republish contacts"
  task republish: :environment do
    Contact.find_each(&:republish)
  end

  desc "Put in place a redirect for an already removed contact"
  task :replace_gone_with_redirect, %i[gone_content_id redirect_to_location] => :environment do |_task, args|
    if args.gone_content_id.blank? || args.redirect_to_location.blank?
      puts "Usage: rake contacts:replace_gone_with_redirect[gone_content_id,redirect_to_location]"
    else
      RedirectorForGoneContact.new(
        gone_content_id: args.gone_content_id,
        redirect_to_location: args.redirect_to_location,
      ).redirect_gone_contact
    end
  end

  desc "Patch links for all contacts with primary_publishing_organisation"
  task patch_links_with_primary_publishing_organisation: :environment do
    count = Contact.count
    puts "Patching links for #{count} contacts with primary_publishing_organisation"
    Contact.all.each_with_index do |contact, i|
      Publisher.client.patch_links(
        contact.content_id,
        links: {
          organisations: [contact.organisation.content_id],
          primary_publishing_organisation: [contact.organisation.content_id],
        },
      )
      puts "Processing #{i}-#{i + 99} of #{count} contacts" if (i % 100).zero?
    end
    puts "Finished patching links for contacts with primary_publishing_organisation"
  end
end
