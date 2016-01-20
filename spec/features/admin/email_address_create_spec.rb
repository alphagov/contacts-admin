require "spec_helper"

describe "Email Address creation", auth: :user do
  include Admin::EmailAddressSteps

  let(:contact)       { create :contact }
  let(:email_address) { build :email_address, contact: contact }

  before {
    verify !email_address_exists(contact, email_address)
  }

  specify "it can be created" do
    create_email_address(contact,
                         title: email_address.title,
                         email: email_address.email
                        )

    verify email_address_exists(contact, email_address)
  end
end
