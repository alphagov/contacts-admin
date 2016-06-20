require "spec_helper"
require 'govuk-content-schema-test-helpers/rspec_matchers'

describe ContactPresenter do
  let(:contact) { create :contact }

  context "#content_id" do
    it "returns the content_id of the contact" do
      content_id = ContactPresenter.new(contact).content_id

      expect(content_id).to eq(contact.content_id)
    end
  end

  context "#present" do
    it "presents the contact correctly against the schema" do
      presented = ContactPresenter.new(contact).payload
      expect(presented.to_json).to be_valid_against_schema('contact')
    end

    it "transforms a contact to the correct format" do
      payload = ContactPresenter.new(contact).payload

      expect(payload[:title]).to eq(contact.title)
      expect(payload[:description]).to eq(contact.description)
      expect(payload[:publishing_app]).to eq("contacts")
      expect(payload[:rendering_app]).to eq("contacts-frontend")
      expect(payload[:routes].first[:path]).to eq(contact.link)
      expect(payload[:public_updated_at]).to be_present
      expect(payload[:need_ids]).to be_empty

      details = payload[:details]
      expect(details[:description]).to eq(contact.description)
      expect(details[:quick_links]).to eq(contact.quick_links.map {|q| {title: q.title, url: q.url} })
      expect(details[:contact_form_links]).to eq(contact.contact_form_links.map(&:as_json))
      expect(details[:more_info_email_address]).to include("<li>")
      expect(details[:more_info_phone_number]).to include("<li>")
    end
  end

  context "#links" do
    it "presents the contact correctly against the schema" do
      links = ContactPresenter.new(contact).links
      expect(links.to_json).to be_valid_against_links_schema("contact")

      expect(links[:links]["organisations"]).to eq([contact.organisation.content_id])
    end

    it "returns links data" do
      content_id = SecureRandom.uuid
      contact.related_contacts << create(:contact, content_id: content_id)

      links = ContactPresenter.new(contact).links

      expect(links[:links]["related"]).to eq([content_id])
    end
  end

  context "with related contacts" do
    let(:contact) { create(:contact, :with_related_contacts) }

    it "links to their content IDs" do
      links = ContactPresenter.new(contact).links

      related_content_ids = contact.related_contacts.pluck(:content_id)

      expect(links[:links]).to include("related")

      # FIXME: change this to `match_exactly` once we have RSpec 3
      expect(links[:links]["related"].sort).to eq(related_content_ids.sort)
    end
  end
end
