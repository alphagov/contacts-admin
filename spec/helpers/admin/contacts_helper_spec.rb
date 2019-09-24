require "rails_helper"

module Admin
  RSpec.describe ContactsHelper, type: :helper do
    describe "#contact_url" do
      it "creates a full url path" do
        organisation = create :organisation
        contact = create :contact

        expect(helper.contact_url(organisation, contact)).to eql(
          "http://www.dev.gov.uk/government/organisations/#{organisation.slug}/contact/#{contact.slug}",
        )
      end
    end
  end
end
