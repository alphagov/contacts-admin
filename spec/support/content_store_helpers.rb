require 'gds_api/test_helpers/publishing_api'

RSpec.configure do |config|
  config.include GdsApi::TestHelpers::PublishingApi
  config.before(:each) do
    stub_default_publishing_api_put
  end
end
