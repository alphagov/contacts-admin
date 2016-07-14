require "spec_helper"
require 'govuk-content-schema-test-helpers/rspec_matchers'

describe ContactRedirectPresenter do
  include GovukContentSchemaTestHelpers::RSpecMatchers

  let(:contact) { create :contact }
  let(:redirect_to_location) { '/foo/bar/baz' }
  subject(:presenter) { described_class.new(contact, redirect_to_location) }
  let(:payload) { subject.present }

  it "transforms a contact to the redirect format" do
    expect(payload[:publishing_app]).to eq("contacts")
    expect(payload[:redirects].size).to eq(1)
    expect(payload[:base_path]).to eq(contact.link)
    expect(payload).not_to have_key(:routes)
  end

  it 'exposes an exact redirect from the contact link to the supplied redirect location' do
    redirect_payload = payload[:redirects].first

    expect(redirect_payload[:path]).to eq(contact.link)
    expect(redirect_payload[:type]).to eq('exact')
    expect(redirect_payload[:destination]).to eq(redirect_to_location)
  end

  it 'includes a content_id that is not the same as contact.content_id' do
    content_id = presenter.content_id

    expect(content_id).not_to be_blank
    expect(content_id).not_to eq(contact.content_id)
  end

  it 'is a valid "redirect" item according to the schema' do
    expect(payload.to_json).to be_valid_against_schema('redirect')
  end
end
