require "rails_helper"

RSpec.describe "FinderSchemaValidation" do
  include GovukSchemas::RSpecMatchers

  it "validates the contacts finder is a valid finder" do
    contacts_finder = PublishFinders.new.send(:hmrc_contacts_payload)

    expect(contacts_finder).to be_valid_against_publisher_schema("finder")
  end
end
