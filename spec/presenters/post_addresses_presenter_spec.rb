require "spec_helper"
require 'gds_api/test_helpers/worldwide'

describe PostAddressesPresenter do
  include GdsApi::TestHelpers::Worldwide
  let(:post) { create :post_address, description: "post description" }

  it "transforms a contact to the correct format" do
    worldwide_api_has_location(post.world_location_slug)

    presented = PostAddressesPresenter.new([post]).present.first

    presented[:title].should eq(post.title)
    presented[:street_address].should eq(post.street_address)
    presented[:postal_code].should eq(post.postal_code)
    presented[:world_location].should eq(post.world_location.title)

    govspeak_description = "<p>#{post.description}</p>"
    presented[:description].should eq(govspeak_description)
  end
end
