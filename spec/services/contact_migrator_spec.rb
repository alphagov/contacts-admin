require "rails_helper"

RSpec.describe ContactMigrator do
  describe "#migrate_contact" do
    it "makes an unpublish request to Publishing API for the contact" do
      contact = create(:contact, slug: "corporation-tax-enquiries")
      new_url = "/find-hmrc-contacts/corporation-tax-general-enquiries"
      ContactMigrator.new.migrate_contact(
        original_url: "/government/organisations/hm-revenue-customs/contact/corporation-tax-enquiries",
        new_url:,
      )

      assert_publishing_api_unpublish(
        contact.content_id,
        type: "redirect",
        explanation: "Migrated to HMRC Specialist Finder",
        alternative_path: new_url,
        discard_drafts: true,
      )
    end
  end
end
