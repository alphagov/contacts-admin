require 'spec_helper'

describe 'Email Address creation', auth: :user do
  include Admin::EmailAddressSteps

  let(:contact_record) { create :contact_record }
  let(:email_address)  { build :email_address, contact_record: contact_record }

  before {
    verify !email_address_exists(contact_record, email_address)
  }

  specify 'it can be created' do
    create_email_address(contact_record, {
      title: email_address.title,
      email: email_address.email
    })

    verify email_address_exists(contact_record, email_address)
  end
end
