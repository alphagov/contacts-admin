require 'spec_helper'

describe 'More Info Post Address record creation', auth: :user do
  include Admin::MoreInfoPostAddressSteps

  let(:contact_record)    { create :contact_record }
  let(:more_info_post_address) { build :more_info_post_address, contact_record: contact_record }

  before {
    verify !more_info_record_exists(contact_record)
  }

  specify 'it can be created' do
    create_more_info_post_address(contact_record, {
      url: more_info_post_address.url
    })

    verify more_info_record_exists(contact_record)
  end
end
