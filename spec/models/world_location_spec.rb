require "rails_helper"

describe WorldLocation, type: :model do
  describe ".all" do
    it "returns a list of WorldLocations" do
      api_response = { "results" => [
        { "format" => "World location", "details" => { "slug" => "United Kingdom" } },
        { "format" => "World location", "details" => { "slug" => "Finland" } },
      ] }.to_json
      stub_request(:get, "http://www.dev.gov.uk/api/world-locations")
       .to_return(status: 200, body: api_response, headers: {})

      locations = WorldLocation.all
      expect(locations.length).to be 2
      expect(locations.first.slug).to eq "United Kingdom"
      expect(locations.last.slug).to eq "Finland"
    end
  end

  describe "#==" do
    let(:wl1) { WorldLocation.new({ "details" => { "slug" => "Neverland" } }) }
    let(:wl2) { WorldLocation.new({ "details" => { "slug" => "Neverland" } }) }
    let(:wl3) { WorldLocation.new({ "details" => { "slug" => "Narnia" } }) }
    let(:not_wl) { build(:organisation, slug: "Neverland") }

    it "returns true if the locations have the same slug" do
      expect(wl1 == wl2).to be true
    end

    it "returns false if the locations have different slugs" do
      expect(wl1 == wl3).to be false
    end

    it "returns false if compared to something other than a WorldLocation" do
      expect(wl1 == not_wl).to be false
    end
  end
end
