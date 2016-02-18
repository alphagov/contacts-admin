require "spec_helper"

describe "Contact creation", auth: :user do
  include Admin::ContactSteps

  let!(:contact_group)       { create(:contact_group, :with_organisation, title: "new contact type") }
  let(:contact)              { build :contact }
  let!(:contact_organisation) { create :organisation }

  before {
    verify !contact_exists(contact)
  }

  specify "it can be created" do
    expect {
      create_contact(
        title: contact.title,
        description: contact.description,
        contact_information: contact.contact_information
      ) do
        select contact_organisation, from: "contact_organisation_id"
        select contact_group, from: "contact_contact_group_ids"
      end
    }.to change { Contact.count }.by(1)
  end

  context "when contact is created" do
    it "delegates to Commands::Rummager" do
      rummager_double = double call: true
      expect(Admin::Rummager).to receive(:new).with(kind_of(Contact)).and_return(rummager_double)

      create_contact(
        title: contact.title,
        description: contact.description,
        contact_information: contact.contact_information
      ) do
        select contact_organisation, from: "contact_organisation_id"
        select contact_group, from: "contact_contact_group_ids"
      end
    end

    it "delegates to Commands::ContactPublisher" do
      publisher_double = double call: true

      expect(Admin::ContactPublisher).to receive(:new)
        .with(kind_of(Contact)).and_return(publisher_double)

      create_contact(
        title: contact.title,
        description: contact.description,
        contact_information: contact.contact_information
      ) do
        select contact_organisation, from: "contact_organisation_id"
        select contact_group, from: "contact_contact_group_ids"
      end
    end
  end
end
