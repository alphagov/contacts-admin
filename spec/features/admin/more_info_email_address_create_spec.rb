require 'spec_helper'

describe 'More Info Email Address record creation', auth: :user do
  include Admin::MoreInfoEmailAddressSteps

  let(:contact_record)    { create :contact_record }
  let(:more_info_email_address) { build :more_info_email_address, contact_record: contact_record }

  before {
    verify !more_info_email_address_exists(contact_record)
  }

  specify 'it can be created' do
    create_more_info_email_address(contact_record, {
      url: more_info_email_address.url
    })

    verify more_info_email_address_exists(contact_record)
  end
end
