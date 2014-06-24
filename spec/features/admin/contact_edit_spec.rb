require "spec_helper"

describe "Contact editing", auth: :user do
  include Admin::ContactSteps

  let!(:contact_group) { create(:contact_group, title: "new contact type") }
  let!(:contact)       { create :contact }

  before { Contact.count.should eq(1) }

  specify "it can be updated" do
    update_contact(
      contact,
      title: "new title",
      description: "new description",
      quick_link_1: "https://www.gov.uk/",
      quick_link_title_1: "GOV.UK",
      popularity: 2
    ) do
      select contact_group, from: "contact_contact_group_ids"
    end

    verify contact_updated(
      contact,
      title: "new title",
      description: "new description",
      quick_link_1: "https://www.gov.uk/",
      quick_link_title_1: "GOV.UK",
      popularity: 2
    )
    verify associated_to_contact_group(contact, contact_group)
  end

  specify "updating a contact sends the data to the content-store" do
    update_contact(contact,
                   title: "new title",
                   description: "new description"
                  )

    assert_content_store_put_item(contact.link, title: "new title", description: "new description")
  end
end
