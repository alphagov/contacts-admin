ENV["RAILS_ENV"] ||= "test"

require "simplecov"
require "simplecov-rcov"

SimpleCov.start "rails"
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

require File.expand_path("../../config/environment", __FILE__)

require "rspec/rails"
require "capybara/rails"
require "slimmer/test"
require "fakefs/spec_helpers"
require "webmock/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Dir[Rails.root.join("spec/features/steps/*.rb")].sort.reverse.each { |f| require f }
Dir[Rails.root.join("spec/features/steps/admin/*.rb")].sort.reverse.each { |f| require f }
Dir[Rails.root.join("spec/features/steps/public/*.rb")].sort.reverse.each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

WebMock.disable_net_connect!(:allow_localhost => true)

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include FeaturesHelpers, type: :feature
  config.include FileCreationHelper
end
