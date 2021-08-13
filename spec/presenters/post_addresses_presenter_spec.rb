require "rails_helper"

describe PostAddressesPresenter do
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

  def stub_worldwide_api_has_location(location_slug, details = nil)
    details ||= world_location_for_slug(location_slug)
    stub_request(:get, "#{Plek.new.website_root}/api/world-locations/#{location_slug}")
      .to_return(status: 200, body: details.to_json)
  end
end
