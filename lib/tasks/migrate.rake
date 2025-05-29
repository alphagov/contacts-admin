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

  desc "This rake task sets up a redirect from the legacy
  `/government/organisations/legal-aid-agency/contact/legal-aid-agency-customer-services`
  route to the agreed replacement for that route: the Legal Aid Agency
  homepage (`/government/organisations/legal-aid-agency`).

  It also deletes the corresponding Contact."
  task legal_aid_agency_contact: :environment do
    Services.publishing_api.unpublish(
      "7d46f9b4-0a6a-4598-afb8-07f437fe4de6",
      type: "redirect",
      explanation: "Deprecated the Legal Aid Agency Customer Services contact to retire Contacts Admin.",
      alternative_path: "/government/organisations/legal-aid-agency",
      discard_drafts: true,
    )

    Contact.find_by(slug: "legal-aid-agency-customer-services").destroy!
  end
end
