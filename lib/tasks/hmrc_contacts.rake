namespace :hmrc_contacts do
  desc "Import contact data from CSV file"
  task import: :environment do
    raise ArgumentError.new("Please provide contact file path using environment variable DATA_FILE") if ENV['DATA_FILE'].blank?

    ImportContacts.new(ENV['DATA_FILE']).import
  end
end
