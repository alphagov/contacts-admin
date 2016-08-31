require "rails_helper"

RSpec.describe ContactFormLink, type: :model do
  let(:item) { create(:contact_form_link) }
  it_behaves_like "an associated data model"

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :link }
end
