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

  # rspec-rails 3 will no longer automatically infer an example group's spec type
  # from the file location. You can explicitly opt-in to the feature using this
  # config option.
  # To explicitly tag specs without using automatic inference, set the `:type`
  # metadata manually:
  #
  #     describe ThingsController, :type => :controller do
  #       # Equivalent to being in spec/controllers
  #     end
  config.infer_spec_type_from_file_location!
end
