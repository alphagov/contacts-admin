require "spec_helper"

describe PhoneNumber do
  let(:item) { create(:phone_number) }
  it_behaves_like "an associated data model"

  it { is_expected.to validate_presence_of :contact }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :number }
end
