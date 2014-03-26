require "spec_helper"

describe "Contacts" do
  include Public::ContactSteps

  let!(:contact) { create(:phone_number).contact }
  let!(:contact2) { create(:phone_number).contact }

  before { Department.first.contacts.count.should eq(2) }
  before { ensure_on contacts_path(Department.first) }

  context "list" do
    it { verify contacts_exist([contact, contact2]) }
  end

  context "filter", js: true do
    before { fill_in "Contains", with: contact.title } # filter

    it { verify contacts_exist([contact]) }
    it { expect(page).to_not have_content(contact2.title) }
  end
end
