require "spec_helper"

describe EmailAddressesPresenter do
  let(:email) { create :email_address, description: "email description" }

  it "transforms a contact to the correct format" do
    presented = EmailAddressesPresenter.new([email]).present.first

    expect(presented[:title]).to eq(email.title)
    expect(presented[:email]).to eq(email.email)

    govspeak_description = "<p>#{email.description}</p>"
    expect(presented[:description]).to eq(govspeak_description)
  end
end
