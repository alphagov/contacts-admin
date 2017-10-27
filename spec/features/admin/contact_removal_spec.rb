require "rails_helper"

feature "Contact removal", auth: :user do
  include Admin::ContactSteps
  include Admin::PublishingApiSteps

  let!(:contact) { create :contact }

  before do
    expect(Contact.count).to eq(1)
  end

  specify "it can be removed" do
    gone_uuid = SecureRandom.uuid
    allow(SecureRandom).to receive_messages(uuid: gone_uuid)

    expect {
      delete_contact(contact)
    }.to change { Contact.count }.by(-1)

    it_should_have_archived_the_page(gone_uuid, contact)
  end
end
