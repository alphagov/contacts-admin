require "spec_helper"
require 'gds_api/test_helpers/worldwide'
include GdsApi::TestHelpers::Worldwide

describe "Contact view" do
  let!(:hmrc)    { create :organisation }
  let!(:contact) { create :contact, :with_contact_group, :with_contact_form_links, :with_post_addresses, :with_phone_numbers, :with_email_addresses }

  before {
    @location_slugs = %w(
        afghanistan angola aruba bangladesh belarus brazil brunei
        cambodia chad croatia denmark eritrea france ghana iceland
        japan laos luxembourg malta micronesia mozambique nicaragua
        panama portugal sao-tome-and-principe singapore south-korea
        sri-lanka uk-delegation-to-council-of-europe
        uk-delegation-to-organization-for-security-and-co-operation-in-europe
        united-kingdom venezuela vietnam)
    worldwide_api_has_locations(@location_slugs)
    contact.organisation = hmrc
    contact.save!
    visit contact_path(contact.organisation.slug, contact)
  }

  context "general info" do
    it { expect(page).to have_content(contact.title) }
  end

  it "should provide a form to report problems" do
    expect(page).to have_selector("#test-report_a_problem")
  end

  context "quick links" do
    (1..3).each do |i| # 3 quick links
      it "quick link #{i}" do
        title = contact.send("quick_link_title_#{i}")
        href = contact.send("quick_link_#{i}")
        expect(page).to have_link(title, href: href)
      end
    end
  end

  context "contact form links" do
    let(:link) { contact.contact_form_links.first }

    it { expect(page).to have_link(link.title, href: link.link) }
  end

  context "emails" do
    let(:email) { contact.email_addresses.first }

    it {
      expect(page).to have_link(email.email, href: "mailto:#{email.email}")
    }
  end

  context "phone numbers" do
    let(:number) { contact.phone_numbers.first }

    it { expect(page).to have_content(number.number) }
  end

  context "addresses" do
    let(:address) { contact.post_addresses.first }

    [:title, :description, :address, :street_address, :postal_code].each do |field|
      it { expect(page).to have_content(address.send(field)) }
    end
  end

  context "query response time" do
    let(:query_text) { "Find out when to expect a response to your query" }

    context "shown" do
      it { expect(page).to_not have_content(query_text) } # query_response_time false by default
    end

    context "hidden" do
      let!(:contact) { create :contact, query_response_time: true }

      it { expect(page).to have_content(query_text) }
    end
  end
end
