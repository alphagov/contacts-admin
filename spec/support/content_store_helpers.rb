require 'gds_api/test_helpers/content_store'

RSpec.configure do |config|
  config.include GdsApi::TestHelpers::ContentStore
  config.before(:each) do
    stub_default_content_store_put
  end
end
