require "spec_helper"
require 'govuk-content-schema-test-helpers/rspec_matchers'

describe ContactPresenter do
  let(:contact) { create :contact }

  it "presents the contact correctly against the schema" do
    presented = ContactPresenter.new(contact).present
    expect(presented.to_json).to be_valid_against_schema('contact')
  end

  it "transforms a contact to the correct format" do
    payload = ContactPresenter.new(contact).present

    expect(payload[:content_id]).to eq(contact.content_id)
    expect(payload[:title]).to eq(contact.title)
    expect(payload[:description]).to eq(contact.description)
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:rendering_app]).to eq("contacts-frontend")
    expect(payload[:update_type]).to eq("major")
    expect(payload[:routes].first[:path]).to eq(contact.link)
    expect(payload[:public_updated_at]).to be_present
    expect(payload[:need_ids]).to be_empty

    details = payload[:details]
    expect(details[:slug]).to eq(contact.slug)
    expect(details[:title]).to eq(contact.title)
    expect(details[:description]).to eq(contact.description)
    expect(details[:quick_links]).to eq(contact.quick_links.map {|q| {title: q.title, url: q.url} })
    expect(details[:contact_form_links]).to eq(contact.contact_form_links.map(&:as_json))
    expect(details[:more_info_email_address]).to include("<li>")
    expect(details[:more_info_phone_number]).to include("<li>")
  end

  context "with related contacts" do
    let (:contact) { create(:contact, :with_related_contacts) }

    it "links to their content IDs" do
      payload = ContactPresenter.new(contact).present

      related_content_ids = contact.related_contacts.pluck(:content_id)

      expect(payload[:links]).to include("related")

      # FIXME: change this to `match_exactly` once we have RSpec 3
      expect(payload[:links]["related"].sort).to eq(related_content_ids.sort)
    end
  end
end
