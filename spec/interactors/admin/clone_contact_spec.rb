require "rails_helper"
require "gds_api/test_helpers/worldwide"

describe Admin::CloneContact do
  include GdsApi::TestHelpers::Worldwide

  describe "#clone" do
    context "contact exists" do
      let(:contact) { create :contact, :with_contact_group, :with_contact_form_links, :with_post_addresses, :with_phone_numbers, :with_email_addresses }
      before do
        stub_worldwide_api_has_selection_of_locations
      end

      it "clones the contact and returns the clone" do
        clone = described_class.new(contact).clone

        expect(contact.reload).to be_present
        expect(clone.reload).to be_present

        expect(clone.contact_groups).to eq(contact.contact_groups)

        expect(clone.contact_form_links.first.title).to eq(contact.contact_form_links.first.title)
        expect(clone.post_addresses.first.title).to eq(contact.post_addresses.first.title)
        expect(clone.phone_numbers.first.title).to eq(contact.phone_numbers.first.title)
        expect(clone.email_addresses.first.title).to eq(contact.email_addresses.first.title)
      end
    end
  end

  def stub_worldwide_api_has_selection_of_locations
    stub_worldwide_api_has_locations %w[
      afghanistan
      angola
      australia
      bahamas
      belarus
      brazil
      brunei
      cambodia
      chad
      croatia
      denmark
      eritrea
      france
      ghana
      iceland
      japan
      laos
      luxembourg
      malta
      micronesia
      mozambique
      nicaragua
      panama
      portugal
      sao-tome-and-principe
      singapore
      south-korea
      sri-lanka
      uk-delegation-to-council-of-europe
      uk-delegation-to-organization-for-security-and-co-operation-in-europe
      united-kingdom
      venezuela
      vietnam
    ]
  end
end
