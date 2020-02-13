require "gds_api/test_helpers/publishing_api"

RSpec.configure do |config|
  config.include GdsApi::TestHelpers::PublishingApi
  config.before(:each) do
    stub_any_publishing_api_put_content
    stub_any_publishing_api_patch_links
    stub_any_publishing_api_call
  end
end
