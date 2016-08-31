require "rails_helper"

RSpec.describe PhoneNumber, type: :model do
  let(:item) { create(:phone_number) }
  it_behaves_like "an associated data model"

  it { is_expected.to validate_presence_of :contact }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :number }
end
