require "rails_helper"

describe WorldLocation do
  describe :all do
    it "returns a list of WorldLocations" do
      allow(Rails).to receive_message_chain(:cache, :fetch).and_return([
        { "format" => "World location", "details" => { "slug" => "United Kingdom" } },
        { "format" => "World location", "details" => { "slug" => "Finland" } },
      ])

      locations = WorldLocation.all
      expect(locations.length).to be 2
      expect(locations.first.slug).to eq "United Kingdom"
      expect(locations.last.slug).to eq "Finland"
    end
  end

  describe :== do
    let(:wl1) { WorldLocation.new({ "details" => { "slug" => "Neverland" } }) }
    let(:wl2) { WorldLocation.new({ "details" => { "slug" => "Neverland" } }) }

    it "returns true if the locations have the same slug" do
      expect(wl1 == wl2).to be true
    end
  end
end
