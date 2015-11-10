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

  desc "Register all contacts with the publishing-api"
  task :register_in_content_store => :environment do
    Contact.find_each do |contact|
      p = ContactPresenter.new(contact)
      ::Contacts.publishing_api.put_content_item(contact.link, p.present)
    end
  end

  desc "Remove a contact and redirect it"
  task :remove_with_redirect, [:contact_slug, :redirect_to_location] => :environment do |_task, args|
    if args.contact_slug.blank? || args.redirect_to_location.blank?
      puts "Usage: rake contacts:remove_with_redirect[contact-to-remove-slug,path-to-redirect-to]"
    else
      contact = Contact.find_by_slug(args.contact_slug)
      if contact.nil?
        puts "Contact #{args.contact_slug} doesn't exist."
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
end
