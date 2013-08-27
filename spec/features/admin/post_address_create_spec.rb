require 'spec_helper'

describe 'Post Address creation', auth: :user do
  include Admin::PostAddressSteps

  let(:contact_record) { create :contact_record }
  let(:post_address)   { build :post_address, contact_record: contact_record }

  before {
    verify !post_address_exists(contact_record, post_address)
  }

  specify 'it can be created' do
    create_post_address(contact_record, {
      title: post_address.title,
      address: post_address.address
    })

    verify post_address_exists(contact_record, post_address)
  end
end
