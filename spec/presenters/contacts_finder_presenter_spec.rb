require "spec_helper"
require 'govuk-content-schema-test-helpers/rspec_matchers'

describe ContactsFinderPresenter do
  include GovukContentSchemaTestHelpers::RSpecMatchers

  let(:group) { create :contact_group, :with_organisation }

  it "presents the exportable_attributes correctly" do
    presented = ContactsFinderPresenter.new(group.organisation).present

    expect(presented[:title]).to             include(group.organisation.title)
    expect(presented[:public_updated_at]).to eq(group.updated_at.to_s)
    expect(presented.to_json).to be_valid_against_schema('finder')
  end
end
