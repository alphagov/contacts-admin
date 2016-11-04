require 'rails_helper'
require 'govuk-content-schema-test-helpers/rspec_matchers'

RSpec.describe "FinderSchemaValidation" do
  include GovukContentSchemaTestHelpers::RSpecMatchers

  it "validates the contacts finder is a valid finder" do
    contacts_finder = PublishFinders.new.send(:hmrc_contacts_payload)

    expect(contacts_finder).to be_valid_against_schema('finder')
  end
end
