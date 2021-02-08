namespace :organisations do
  desc "Import organisations from Whitehall"
  task import: :environment do
    Contacts::DistributedLock.new.lock do
      ImportOrganisations.new.call
    end
  end
end
