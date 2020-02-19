require "rails_helper"
require "gds_api/test_helpers/worldwide"

describe PostAddressesPresenter do
  include GdsApi::TestHelpers::Worldwide
  let(:post) { create :post_address, description: "post description" }

  it "transforms a contact to the correct format" do
    stub_worldwide_api_has_location(post.world_location_slug)

    presented = PostAddressesPresenter.new([post]).present.first

    expect(presented[:title]).to eq(post.title)
    expect(presented[:street_address]).to eq(post.street_address)
    expect(presented[:postal_code]).to eq(post.postal_code)
    expect(presented[:world_location]).to eq(post.world_location.title)

    govspeak_description = "<p>#{post.description}</p>"
    expect(presented[:description].strip).to eq(govspeak_description)
  end
end
