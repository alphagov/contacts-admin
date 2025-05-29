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

  describe "#migrate_hmrc_contacts" do
    before do
      allow(YAML).to receive(:load_file).and_return(
        YAML.safe_load(<<~YAML_STUB),
          contacts:
            - original_url: https://www.gov.uk/government/organisations/hm-revenue-customs/contact/corporation-tax-enquiries
              new_url: https://www.gov.uk/find-hmrc-contacts/corporation-tax-general-enquiries
            - original_url: https://www.gov.uk/government/organisations/hm-revenue-customs/contact/agent-dedicated-line-debt-management
              new_url: https://www.gov.uk/find-hmrc-contacts/agent-dedicated-line-debt-management
        YAML_STUB
      )
      create(:contact, slug: "corporation-tax-enquiries")
      create(:contact, slug: "agent-dedicated-line-debt-management")
    end

    it "reads data from config/hmrc_contacts_to_redirect.yml" do
      expect(YAML).to receive(:load_file).with(Rails.root.join("config/hmrc_contacts_to_redirect.yml"))
      ContactMigrator.new.migrate_hmrc_contacts
    end

    it "calls `migrate_contact` on every contact in the file" do
      migrator = ContactMigrator.new
      allow(migrator).to receive(:migrate_contact)

      expect(migrator).to receive(:migrate_contact).with(
        original_url: "https://www.gov.uk/government/organisations/hm-revenue-customs/contact/corporation-tax-enquiries",
        new_url: "https://www.gov.uk/find-hmrc-contacts/corporation-tax-general-enquiries",
      ).once.ordered
      expect(migrator).to receive(:migrate_contact).with(
        original_url: "https://www.gov.uk/government/organisations/hm-revenue-customs/contact/agent-dedicated-line-debt-management",
        new_url: "https://www.gov.uk/find-hmrc-contacts/agent-dedicated-line-debt-management",
      ).once.ordered

      migrator.migrate_hmrc_contacts
    end

    it "deletes all relevant contacts if it succeeds" do
      expect(Contact.where(slug: "corporation-tax-enquiries").count).to eq(1)
      expect(Contact.where(slug: "agent-dedicated-line-debt-management").count).to eq(1)

      ContactMigrator.new.migrate_hmrc_contacts

      expect(Contact.where(slug: "corporation-tax-enquiries").count).to eq(0)
      expect(Contact.where(slug: "agent-dedicated-line-debt-management").count).to eq(0)
    end

    it "avoids deleting ANY contacts if it encounters an error" do
      Contact.find_by(slug: "agent-dedicated-line-debt-management").update!(slug: "contact-that-doesnt-exist")

      expect { ContactMigrator.new.migrate_hmrc_contacts }.to raise_error(MigrateContactError::ContactNotFound)

      expect(Contact.where(slug: "corporation-tax-enquiries").count).to eq(1)
    end
  end
end
