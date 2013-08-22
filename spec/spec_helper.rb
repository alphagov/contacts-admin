ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'fakefs/spec_helpers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/features/steps/**/*.rb")].reverse.each {|f| require f}

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = "random"

  config.include FactoryGirl::Syntax::Methods
  config.include FeaturesHelpers, type: :feature
  config.include FileCreationHelper

  config.before(:each) do
    # ActiveHash clean slate for testing
    [ContactType,Department].each(&:delete_all)
  end
end
