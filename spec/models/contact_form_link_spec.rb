require "spec_helper"

describe ContactFormLink do
  let(:item) { create(:contact_form_link) }
  it_behaves_like "an associated data model"

  it { should validate_presence_of :title }
  it { should validate_presence_of :link }
end
