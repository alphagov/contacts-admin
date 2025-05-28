require "rails_helper"

RSpec.describe ContactMigrator do
  describe "#migrate_contact" do
    let(:original_url) { "/government/organisations/hm-revenue-customs/contact/corporation-tax-enquiries" }
    let(:new_url) { "/find-hmrc-contacts/corporation-tax-general-enquiries" }

    it "makes an unpublish request to Publishing API for the contact" do
      contact = create(:contact, slug: "corporation-tax-enquiries")
      ContactMigrator.new.migrate_contact(original_url:, new_url:)

      assert_publishing_api_unpublish(
        contact.content_id,
        type: "redirect",
        explanation: "Migrated to HMRC Specialist Finder",
        alternative_path: new_url,
        discard_drafts: true,
      )
    end

    it "errors if no contact can be found for the provided URL" do
      typo_url = "/government/organisations/hm-revenue-customs/contact/corporation-tax-enquiries-typo"
      bad_args = {
        original_url: typo_url,
        new_url:,
      }

      expect { ContactMigrator.new.migrate_contact(**bad_args) }.to raise_error(
        MigrateContactError::ContactNotFound,
        "No corresponding Contact found for #{typo_url}",
      )
    end

    it "errors if no redirect URL provided" do
      create(:contact, slug: "corporation-tax-enquiries")

      expect { ContactMigrator.new.migrate_contact(original_url:) }.to raise_error(
        MigrateContactError::RedirectUrlMissing,
        "Missing a redirect URL (`new_url`) for #{original_url}",
      )
    end

    it "destroys the Contact" do
      slug = "corporation-tax-enquiries"
      contact = create(:contact, slug:)
      expect(Contact.find_by(slug:)).to eq(contact)
      ContactMigrator.new.migrate_contact(
        original_url:,
        new_url:,
      )
      expect(Contact.find_by(slug:)).to eq(nil)
    end

    it "doesn't destroy the Contact if the unpublish request failed (for whatever reason)" do
      slug = "corporation-tax-enquiries"
      contact = create(:contact, slug:)
      good_args = { original_url:, new_url: }
      stub_any_publishing_api_unpublish.and_raise(GdsApi::HTTPServerError.new(500, "Arbitrary error message"))
      expect { ContactMigrator.new.migrate_contact(**good_args) }.to raise_error(
        MigrateContactError::PublishingApiRequestFailed,
        "GdsApi::HTTPServerError error (500): Arbitrary error message",
      )
      expect(Contact.find_by(slug:)).to eq(contact) # Contact still exists
    end
  end
end
