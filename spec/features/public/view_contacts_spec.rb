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
end
