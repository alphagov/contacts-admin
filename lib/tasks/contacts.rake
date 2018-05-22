namespace :contacts do
  desc "Import contact data from CSV file"
  task import_hmrc: :environment do
    raise ArgumentError.new("Please provide contact file path using environment variable DATA_FILE") if ENV['DATA_FILE'].blank?

    ImportContacts.new(ENV['DATA_FILE']).import
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
      address.description = strings[5..-1].join("\n") if strings.length > 5
      address.save(validate: false)
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

  desc "Remove a contact and redirect it"
  task :remove_with_redirect, [:contact_slug, :redirect_to_location] => :environment do |_task, args|
    if args.contact_slug.blank? || args.redirect_to_location.blank?
      puts "Usage: rake contacts:remove_with_redirect[contact-to-remove-slug,path-to-redirect-to]"
    else
      contact = Contact.find_by_slug(args.contact_slug)
      if contact.nil?
        puts "Contact #{args.contact_slug} doesn't exist, consider using rake contacts:replace_gone_with_redirect"
      else
        print "Contact #{contact.link} removed with redirect to #{args.redirect_to_location} "
        if Admin::DestroyAndRedirectContact.new(contact, args.redirect_to_location).destroy_and_redirect
          puts "SUCCESS"
        else
          puts "ERROR"
        end
      end
    end
  end

  desc "Put in place a redirect for an already removed contact"
  task :replace_gone_with_redirect, %i[gone_content_id redirect_to_location] => :environment do |_task, args|
    if args.gone_content_id.blank? || args.redirect_to_location.blank?
      puts "Usage: rake contacts:replace_gone_with_redirect[gone_content_id,redirect_to_location]"
    else
      RedirectorForGoneContact.new(
        gone_content_id: args.gone_content_id,
        redirect_to_location: args.redirect_to_location
      ).redirect_gone_contact
    end
  end
end
