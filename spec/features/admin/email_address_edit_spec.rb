require 'spec_helper'

describe 'Email Address editing', auth: :user do
  include Admin::EmailAddressSteps

  let!(:contact)       { create :contact }
  let!(:email_address) { create :email_address, contact: contact  }

  before { verify email_address_exists(contact, email_address) }

  specify 'it can be updated' do
    update_email_address(email_address, title: 'new title')

    verify email_address_updated(email_address, title: 'new title')
  end
end
