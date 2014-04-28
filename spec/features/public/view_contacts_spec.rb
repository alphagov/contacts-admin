require "spec_helper"

describe "Contacts" do
  include Public::ContactSteps

  let!(:hmrc) { create :organisation }
  let!(:contact) { create(:contact, :with_phone_numbers, :with_contact_group) }
  let!(:contact2) { create(:contact, :with_phone_numbers, :with_contact_group) }

  before {
    ContactGroup.all.each do |group|
      group.organisation = Organisation.first
      group.save!
    end
    Contact.all.each do |contact|
      contact.organisation = Organisation.first
      contact.save!
    end
    ensure_on contacts_path(Organisation.first)
  }

  context "list" do
    it { verify contacts_exist([contact, contact2]) }
  end

  it "should provide a form to report problems" do
    expect(page).to have_selector("#test-report_a_problem")
  end

  context "filter" do
    let(:refresh_results) { click_on "Refresh results" }

    context "by title" do
      before {
        fill_in "Contains", with: contact.title
        refresh_results
      }

      it { should_list_contact(contact) }
      it { should_not_list_contact(contact2) }
    end
    context "by topic" do
      before {
        select contact.contact_groups.first.to_s, from: "Topic"
        refresh_results
      }

      it { should_list_contact(contact) }
      it { should_not_list_contact(contact2) }
    end
    context "by both title and topic" do
      before {
        fill_in "Contains", with: contact.title
        select contact.contact_groups.first.to_s, from: "Topic"
        refresh_results
      }

      it { should_list_contact(contact) }
      it { should_not_list_contact(contact2) }
    end
  end
end
