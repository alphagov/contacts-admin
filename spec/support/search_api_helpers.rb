require 'gds_api/test_helpers/rummager'

RSpec.configure do |config|
  config.include GdsApi::TestHelpers::Rummager
  config.before(:each) do
    # At the time of writing, saving a contact always triggers a call to
    # Rummager.
    # Rather than writing the stub in most of the specs, stub it by default,
    # like we do for adding to the content store.
    stub_any_rummager_post
  end
end
