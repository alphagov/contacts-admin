namespace :contacts do
  desc "Import contact data from CSV file"
  task import_hmrc: :environment do
    raise ArgumentError.new("Please provide contact file path using environment variable DATA_FILE") if ENV['DATA_FILE'].blank?

    ImportContacts.new(ENV['DATA_FILE']).import
  end

  desc "Index Contacts & Questions in rummager"
  task index: :environment do
    RUMMAGER_INDEX.add_batch Contact.includes(:contact_group, :questions, :department).all.map(&:to_indexed_json)
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

  desc "Fix contact group id on questions"
  task fix_questions: :environment do
    Question.all.to_a.each do |question|
      question.update_attribute :contact_group_id, question.contact.contact_group.id if question.contact.contact_group
    end
    Question.where(contact_group_id: nil).destroy_all
  end
end