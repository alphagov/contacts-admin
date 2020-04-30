shared_context "mock world location", mock_world_location: true do
  before do
    allow(WorldLocation).to receive(:all).and_return(
      [
        WorldLocation.new(
          "title" => "United Kingdom ",
          "details" => {
              "slug" => "united-kingdom",
            },
        ),
      ],
    )

    allow(WorldLocation).to receive(:find).and_return(
      WorldLocation.new(
        "title" => "United Kingdom ",
        "details" => {
            "slug" => "united-kingdom",
          },
      ),
    )
  end
end
