require "rails_helper"

feature "Contact creation", auth: :user do
  include Admin::ContactSteps

  let!(:contact_group)       { create(:contact_group, title: "new contact type") }
  let(:contact)              { attributes_for :contact }
  let!(:contact_organisation) { create :organisation }

  before {
    verify !contact_exists(contact)
  }

  specify "it can be created" do
    expect {
      create_contact(
        title: contact[:title],
        description: contact[:description],
        contact_information: contact[:contact_information]
      ) do
        select contact_organisation, from: "contact_organisation_id"
        select contact_group, from: "contact_contact_group_ids"
      end
    }.to change { Contact.count }.by(1)
  end

  specify "it tags the content item with the correct organisation" do
    create_contact(
      title: contact[:title],
      description: contact[:description],
    ) do
      select contact_organisation, from: "contact_organisation_id"
    end

    created_contact = Contact.last

    assert_publishing_api_patch_links(
      created_contact.content_id,
      links: {
        organisations: [contact_organisation.content_id],
        primary_publishing_organisation: [contact_organisation.content_id]
      }
    )
  end
end
