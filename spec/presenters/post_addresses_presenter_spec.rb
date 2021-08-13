require "rails_helper"

describe PostAddressesPresenter do
  let(:post) { create :post_address, description: "post description" }

  it "transforms a contact to the correct format" do
    # stub_worldwide_api_has_location(post.world_location_slug)
    stub_request(:get, "http://www.dev.gov.uk/api/world-locations/united-kingdom")
      .to_return(status: 200, body: "ANYTHING")

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
    stub_request(:get, "http://www.dev.gov.uk/api/world-locations/#{location_slug}")
      .to_return(status: 200, body: details.to_json)
  end

  def world_location_for_slug(slug)
    response_base.merge(world_location_details_for_slug(slug))
  end

  def response_base
    {
      "_response_info" => {
        "status" => "ok",
      },
    }
  end

  # Constructs a sample world_location
  #
  # if the slug contains 'delegation' or 'mission' the format will be set to 'International delegation'
  # othersiwe it will be set to 'World location'
  def world_location_details_for_slug(slug)
    {
      "id" => "https://www.gov.uk/api/world-locations/#{slug}",
      "title" => titleize_slug(slug, title_case: true),
      "format" => (slug =~ /(delegation|mission)/ ? "International delegation" : "World location"),
      "updated_at" => "2013-03-25T13:06:42+00:00",
      "web_url" => "https://www.gov.uk/government/world/#{slug}",
      "details" => {
        "slug" => slug,
        "iso2" => slug[0..1].upcase,
      },
      "organisations" => {
        "id" => "https://www.gov.uk/api/world-locations/#{slug}/organisations",
        "web_url" => "https://www.gov.uk/government/world/#{slug}#organisations",
      },
      "content_id" => "content_id_for_#{slug}",
    }
  end

  def titleize_slug(slug, options = {})
    if options[:title_case]
      slug.tr("-", " ").gsub(/\b./, &:upcase)
    else
      slug.tr("-", " ").capitalize
    end
  end
end
