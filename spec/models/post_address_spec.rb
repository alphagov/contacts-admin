require "spec_helper"

RSpec.describe PostAddress, type: :model do
  let(:item) { create(:post_address) }
  it_behaves_like "an associated data model"

  it { is_expected.to validate_presence_of :contact }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :street_address }
  it { is_expected.to validate_presence_of :postal_code }
  it { is_expected.to validate_presence_of :world_location_slug }
end
