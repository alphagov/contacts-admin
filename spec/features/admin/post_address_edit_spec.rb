require "rails_helper"

feature "Post Address editing", auth: :user, mock_world_location: true do
  include Admin::PostAddressSteps

  let!(:contact)      { create :contact }
  let!(:post_address) { create :post_address, contact: }

  before { verify post_address_exists(contact, post_address) }

  specify "it can be updated" do
    update_post_address(post_address, title: "new title")

    verify post_address_updated(post_address, title: "new title")
  end
end
