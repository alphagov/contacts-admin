require "rails_helper"

RSpec.describe ContactGroup, type: :model do
  let(:item) { create(:contact_group) }
  it_behaves_like "a versioned data model"

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
end
