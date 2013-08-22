require 'spec_helper'

describe 'Email Address removal', auth: :user do
  include Admin::EmailAddressSteps

  let!(:contact_record) { create :contact_record }
  let!(:email_address)        { create :email_address, contact_record: contact_record  }

  before { verify email_address_exists(contact_record, email_address) }

  specify 'it can be removed' do
    delete_email_address(email_address)

    verify !email_address_exists(contact_record, email_address)
  end
end
