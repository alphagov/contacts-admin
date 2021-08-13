require "rails_helper"

RSpec.describe PostAddress, type: :model do
  setup do
    stub_request(:get, "http://www.dev.gov.uk/api/world-locations/united-kingdom")
    .to_return(status: 200, body: "ANYTHING")
  end

  let(:item) { create(:post_address) }
  it_behaves_like "an associated data model"
  it_behaves_like "a versioned data model"

  it { is_expected.to validate_presence_of :contact }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :postal_code }
  it { is_expected.to validate_presence_of :world_location_slug }
end
