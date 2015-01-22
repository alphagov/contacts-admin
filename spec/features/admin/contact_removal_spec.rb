require "spec_helper"

describe "Contact removal", auth: :user do
  include Admin::ContactSteps
  include Admin::PublishingApiSteps
  include Admin::SiteSearchSteps

  let!(:contact) { create :contact }

  before { Contact.count.should eq(1) }

  specify "it can be removed" do
    it_should_remove_the_page_from_search(contact)

    expect {
      delete_contact(contact)
    }.to change { Contact.count }.by(-1)

    it_should_have_archived_the_page(contact)
  end
end
