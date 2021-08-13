require "webmock/rspec"

WebMock.disable_net_connect!(allow_localhost: true)

require "govuk-content-schema-test-helpers/test_unit"

GovukContentSchemaTestHelpers.configure do |config|
  config.schema_type = "publisher_v2"
  config.project_root = Rails.root
end
