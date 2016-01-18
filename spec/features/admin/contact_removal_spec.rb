require "spec_helper"

describe "Contact removal", auth: :user do
  include Admin::ContactSteps
  include Admin::PublishingApiSteps
  include Admin::SiteSearchSteps

  let!(:contact) { create :contact }

  before do
    Contact.count.should eq(1)
    stub_any_rummager_delete
  end

  specify "it can be removed" do
    gone_uuid = SecureRandom.uuid
    SecureRandom.stub(uuid: gone_uuid)

    expect {
      delete_contact(contact)
    }.to change { Contact.count }.by(-1)

    it_should_have_archived_the_page(gone_uuid, contact)
    it_should_have_removed_the_page_from_search(contact)
  end
end
