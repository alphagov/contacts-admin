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
end
