require 'spec_helper'

describe 'More Info email_address editing', auth: :user do
  include Admin::MoreInfoEmailAddressSteps

  let!(:contact_record)        { create :contact_record }
  let!(:more_info_email_address)     { create :more_info_email_address, contact_record: contact_record }
  let(:new_url)               { 'http://www.example.com/new_url' }

  before {
    verify more_info_email_address_exists(contact_record)
  }

  specify 'it can be updated' do
    update_more_info_email_address(contact_record, {
      url: new_url
    })

    verify more_info_email_address_updated(contact_record, url: new_url)
  end
end
