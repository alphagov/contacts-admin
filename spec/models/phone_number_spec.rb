require "spec_helper"

describe PhoneNumber do
  let(:item) { create(:phone_number) }
  it_behaves_like "an associated data model"

  it { should validate_presence_of :contact }
  it { should validate_presence_of :title }
  it { should validate_presence_of :number }
end
