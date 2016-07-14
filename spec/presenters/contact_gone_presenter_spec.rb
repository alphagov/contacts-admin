require "spec_helper"
require 'govuk-content-schema-test-helpers/rspec_matchers'

describe ContactGonePresenter do
  include GovukContentSchemaTestHelpers::RSpecMatchers

  let(:contact) { create :contact }
  subject(:presenter) { described_class.new(contact) }
  let(:payload) { subject.present }

  it "transforms a contact to the correct format" do
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:routes].first[:path]).to eq(contact.link)
    expect(payload[:base_path]).to eq(contact.link)
  end

  it 'includes a content_id that is not the same as contact.content_id' do
    content_id = presenter.content_id

    expect(content_id).not_to be_blank
    expect(content_id).not_to eq(contact.content_id)
  end

  it 'is a valid "gone" item according to the schema' do
    expect(payload.to_json).to be_valid_against_schema('gone')
  end
end
