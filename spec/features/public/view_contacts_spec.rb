require "spec_helper"

describe "Contacts" do
  include Public::ContactSteps
  let!(:contact) { create :contact }
  let!(:contact2) { create :contact }

  before { Department.first.contacts.count.should eq(2) }

  specify "are listed" do
    ensure_on contacts_path(Department.first)
    verify contacts_exist([contact, contact2])
  end

  specify "should filter contacts", js: true do
    # contacts for listing
    contact = create(:phone_number).contact
    contact2 = create(:phone_number).contact

    visit contacts_path(Department.first)

    fill_in "Contains", with: contact.title # filter

    page.should have_content(contact.title)
    page.should have_content(contact.description)

    page.should_not have_content(contact2.title)
    page.should_not have_content(contact2.description)
  end
end
