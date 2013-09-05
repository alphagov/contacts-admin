require 'spec_helper'

describe 'Post Address creation', auth: :user do
  include Admin::PostAddressSteps

  let(:contact)      { create :contact }
  let(:post_address) { build :post_address, contact: contact }

  before {
    verify !post_address_exists(contact, post_address)
  }

  specify 'it can be created' do
    create_post_address(contact, {
      title: post_address.title,
      address: post_address.address
    })

    verify post_address_exists(contact, post_address)
  end
end
