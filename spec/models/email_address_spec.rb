require "spec_helper"

describe EmailAddress do
  let(:item) { create(:email_address) }
  it_behaves_like "an associated data model"

  describe "validations" do
    it { should validate_presence_of :contact }
    it { should validate_presence_of :title }
    it { should validate_presence_of :email }
  end
end
