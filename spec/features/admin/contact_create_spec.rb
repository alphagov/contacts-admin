require "spec_helper"

describe "Contact creation", auth: :user do
  include Admin::ContactSteps

  let!(:contact_group)       { create(:contact_group, title: "new contact type") }
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
end
