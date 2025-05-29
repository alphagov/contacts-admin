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

  desc "DANGER

  This rake task sets up a redirect from the legacy
  `/government/organisations/hm-revenue-customs/contact`
  route to the new `/find-hmrc-contacts` route.

  It should not be run until we HMRC is ready for the specialist finder to
  be their new means of surfacing HMRC contacts."
  task finder: :environment do
    Services.publishing_api.unpublish(
      "b110c03c-3f8d-4327-906b-17ebd872e6a6",
      type: "redirect",
      explanation: "Migrated to HMRC Specialist Finder",
      alternative_path: "/find-hmrc-contacts",
      discard_drafts: true,
    )
  end
end
