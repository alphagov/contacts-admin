require 'ostruct'

shared_context "mock world location", mock_world_location: true do

  before {
    allow(WorldLocation).to receive(:all).and_return([OpenStruct.new({slug: "united-kingdom", title: "United Kingdom"})])
    allow(WorldLocation).to receive(:find).and_return(OpenStruct.new({slug: "united-kingdom", title: "United Kingdom"}))
  }
end
