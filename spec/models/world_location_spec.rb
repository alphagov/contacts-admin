require "rails_helper"
require "gds_api/test_helpers/worldwide"

describe WorldLocation, type: :model do
  include GdsApi::TestHelpers::Worldwide

  describe ".all" do
    it "returns a list of WorldLocations" do
      stub_worldwide_api_has_locations(%w[united-kingdom finland])

      locations = WorldLocation.all
      expect(locations.length).to be 2
      expect(locations.first.slug).to eq "united-kingdom"
      expect(locations.first.title).to eq "United Kingdom"
      expect(locations.last.slug).to eq "finland"
      expect(locations.last.title).to eq "Finland"
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
