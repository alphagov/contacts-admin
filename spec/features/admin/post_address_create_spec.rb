require "spec_helper"

feature "Post Address creation", auth: :user, mock_world_location: true do
  include Admin::PostAddressSteps

  let(:contact)      { create :contact }
  let(:post_address) { build :post_address, contact: contact }

  before {
    verify !post_address_exists(contact, post_address)
  }

  specify "it can be created" do
    create_post_address(contact,
                        title: post_address.title,
                        street_address: post_address.street_address,
                        postal_code: post_address.postal_code
                       )

    verify post_address_exists(contact, post_address)
  end
end
