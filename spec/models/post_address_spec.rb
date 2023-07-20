require "rails_helper"
require "gds_api/test_helpers/worldwide"

RSpec.describe PostAddress, type: :model do
  include GdsApi::TestHelpers::Worldwide

  setup do
    stub_worldwide_api_has_locations(%w[united-kingdom finland])
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
