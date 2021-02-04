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

  specify "it doesn't accept full URLs (even GOV.UK ones)" do
    redirect_url = "https://www.gov.uk/foo"

    expect {
      delete_and_redirect_contact(contact, redirect_url)
    }.to change { Contact.count }.by(0)

    expect(page).to have_content("Invalid redirect URL")
  end

  specify "it doesn't accept invalid paths" do
    redirect_url = "/ some broken path"

    expect {
      delete_and_redirect_contact(contact, redirect_url)
    }.to change { Contact.count }.by(0)

    expect(page).to have_content("Invalid redirect URL")
  end
end
