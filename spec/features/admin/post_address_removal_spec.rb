require "rails_helper"

feature "Post Address removal", auth: :user, mock_world_location: true do
  include Admin::PostAddressSteps

  let!(:contact)      { create :contact }
  let!(:post_address) { create :post_address, contact: contact }

  before { verify post_address_exists(contact, post_address) }

  specify "it can be removed" do
    delete_post_address(post_address)

    verify !post_address_exists(contact, post_address)
  end
end
