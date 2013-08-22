require 'spec_helper'

describe 'Post Address removal', auth: :user do
  include Admin::PostAddressSteps

  let!(:contact_record) { create :contact_record }
  let!(:post_address)        { create :post_address, contact_record: contact_record  }

  before { verify post_address_exists(contact_record, post_address) }

  specify 'it can be removed' do
    delete_post_address(post_address)

    verify !post_address_exists(contact_record, post_address)
  end
end
