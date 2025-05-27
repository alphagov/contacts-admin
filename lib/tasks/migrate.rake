namespace :migrate do
  desc "DANGER

  This rake task facilitates in unpublishing all of the HMRC
  contacts originating from Contacts Admin, redirecting to their
  new equivalent `hmrc_contact` specialist document published via
  Specialist Publisher. This will enable us to retire Contacts Admin.
  This rake task migrates old HMRC contacts to the new HMRC Specialist Finder.

  It should not be run until HMRC is ready for the specialist finder to
  be their new means of surfacing HMRC contacts."
  task contacts: :environment do
    ContactMigrator.new.migrate_hmrc_contacts
  end
end
