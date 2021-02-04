require "rails_helper"

feature "Contact removal", auth: :user do
  include Admin::ContactSteps
  include Admin::PublishingApiSteps

  let!(:contact) { create :contact }

  before do
    expect(Contact.count).to eq(1)
  end

  specify "it can be removed" do
    redirect_url = "/foo"

    expect {
      delete_and_redirect_contact(contact, redirect_url)
    }.to change { Contact.count }.by(-1)

    it_should_have_redirected_the_page(contact, redirect_url)
  end
end
