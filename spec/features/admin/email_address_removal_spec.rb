require 'spec_helper'

describe 'Email Address removal', auth: :user do
  include Admin::EmailAddressSteps

  let!(:contact) { create :contact }
  let!(:email_address)        { create :email_address, contact: contact  }

  before { verify email_address_exists(contact, email_address) }

  specify 'it can be removed' do
    delete_email_address(email_address)

    verify !email_address_exists(contact, email_address)
  end
end
