require "spec_helper"

describe EmailAddress do
  let(:item) { create(:email_address) }
  it_behaves_like "an associated data model"

  describe "validations" do
    it { is_expected.to validate_presence_of :contact }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :email }
  end
end
