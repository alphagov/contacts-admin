require "spec_helper"
require 'gds_api/test_helpers/worldwide'

describe PostAddress do
  include GdsApi::TestHelpers::Worldwide

  let(:item) { build(:post_address) }

  before do
    worldwide_api_has_location(item.world_location_slug)
    item.save
  end

  it_behaves_like "an associated data model"

  it { should validate_presence_of :contact }
  it { should validate_presence_of :title }
  it { should validate_presence_of :street_address }
  it { should validate_presence_of :postal_code }
  it { should validate_presence_of :world_location_slug }
end
