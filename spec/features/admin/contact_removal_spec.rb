require "rails_helper"

feature "Contact removal", auth: :user do
  include Admin::ContactSteps
  include Admin::PublishingApiSteps

  let!(:contact) { create :contact }

  before do
    expect(Contact.count).to eq(1)
  end

  def assert_deleted_and_redirects_to(url, path)
    expect {
      delete_and_redirect_contact(contact, url)
    }.to change { Contact.count }.by(-1)

    it_should_have_redirected_the_page(contact, path)
  end

  def assert_not_deleted_when_given_invalid_redirect(redirect_url)
    expect {
      delete_and_redirect_contact(contact, redirect_url)
    }.to change { Contact.count }.by(0)

    expect(page).to have_content("Invalid redirect URL")
  end

  specify "it can be removed" do
    assert_deleted_and_redirects_to("/foo", "/foo")
  end

  context "allows GOV.UK URLs, but sends just the path to Publishing API" do
    around(:each) do |example|
      ClimateControl.modify GOVUK_WEBSITE_ROOT: "https://www.gov.uk" do
        example.run
      end
    end

    specify "it allows HTTPS/WWW variants" do
      assert_deleted_and_redirects_to("https://www.gov.uk/foo", "/foo")
    end

    specify "it allows HTTP/WWW variants" do
      assert_deleted_and_redirects_to("http://www.gov.uk/foo", "/foo")
    end

    specify "it allows HTTPS variants" do
      assert_deleted_and_redirects_to("https://gov.uk/foo", "/foo")
    end

    specify "it allows HTTP variants" do
      assert_deleted_and_redirects_to("http://gov.uk/foo", "/foo")
    end

    specify "it allows different environments" do
      ClimateControl.modify GOVUK_WEBSITE_ROOT: "https://www.integration.publishing.service.gov.uk" do
        assert_deleted_and_redirects_to("https://www.integration.publishing.service.gov.uk/foo", "/foo")
      end
    end
  end

  specify "it doesn't accept non-GOV.UK URLs" do
    assert_not_deleted_when_given_invalid_redirect("https://www.some-website.co.uk/foo")
  end

  specify "it doesn't accept non-whitelisted GOV.UK service domains" do
    assert_not_deleted_when_given_invalid_redirect("https://food.gov.uk/foo")
  end

  specify "it doesn't accept invalid paths" do
    assert_not_deleted_when_given_invalid_redirect("/ some broken path")
  end
end
