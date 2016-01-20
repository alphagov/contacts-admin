require 'gds_api/test_helpers/publishing_api_v2'

RSpec.configure do |config|
  config.include GdsApi::TestHelpers::PublishingApiV2
  config.before(:each) do
    stub_any_publishing_api_put_content
    stub_any_publishing_api_put_links
    stub_any_publishing_api_call
  end
end
