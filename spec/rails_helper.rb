require "simplecov"
require "simplecov-rcov"

SimpleCov.start "rails"
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../config/environment", __dir__)

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rails_helper"
require "rspec/rails"
require "capybara/rails"
require "fakefs/spec_helpers"
require "paper_trail/frameworks/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Dir[Rails.root.join("spec/features/steps/*.rb")].sort.reverse_each { |f| require f }
Dir[Rails.root.join("spec/features/steps/admin/*.rb")].sort.reverse_each { |f| require f }
Dir[Rails.root.join("spec/features/steps/public/*.rb")].sort.reverse_each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.include FactoryBot::Syntax::Methods
  config.include FeaturesHelpers, type: :feature
  config.include FileCreationHelper
end
