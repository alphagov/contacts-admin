require "spec_helper"

describe EmailAddressesPresenter do
  let(:email) { create :email_address, description: "email description" }

  it "transforms a contact to the correct format" do
    presented = EmailAddressesPresenter.new([email]).present.first

    presented[:title].should eq(email.title)
    presented[:email].should eq(email.email)

    govspeak_description = "<p>#{email.description}</p>"
    presented[:description].should eq(govspeak_description)
  end
end
