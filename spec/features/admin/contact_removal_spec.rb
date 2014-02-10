require "spec_helper"

describe "Contact removal", auth: :user do
  include Admin::ContactSteps

  let!(:contact) { create :contact }

  before { Contact.count.should eq(1) }

  specify "it can be removed" do
    RUMMAGER_INDEX.stub(:delete) { true }

    expect {
      delete_contact(contact)
    }.to change { Contact.count }.by(-1)
  end
end
