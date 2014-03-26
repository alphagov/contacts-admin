require "spec_helper"

describe "Contacts" do
  include Public::ContactSteps

  let!(:contact) { create(:contact, :with_phone_numbers, :with_contact_group) }
  let!(:contact2) { create(:contact, :with_phone_numbers, :with_contact_group) }

  before { ensure_on contacts_path(Department.first) }

  context "list" do
    it { verify contacts_exist([contact, contact2]) }
  end

  context "filter", js: true do
    context "by title" do
      before { fill_in "Contains", with: contact.title }

      it { verify contacts_exist([contact]) }
      it { expect(page).to_not have_content(contact2.title) }
    end
    context "by topic" do
      before { select contact.contact_groups.first.to_s, from: "Topic" }

      it { verify contacts_exist([contact]) }
      it { expect(page).to_not have_content(contact2.title) }
    end
    context "by both title and topic" do
      before { 
        fill_in "Contains", with: contact.title
        select contact.contact_groups.first.to_s, from: "Topic"
      }

      it { verify contacts_exist([contact]) }
      it { expect(page).to_not have_content(contact2.title) }
    end
  end
end
