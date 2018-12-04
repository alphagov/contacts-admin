source "https://rubygems.org"

gem "rails", "~> 5.0.2"

gem "active_hash", "2.2.0"
gem 'ancestry', '3.0.5'
gem "friendly_id", "5.2.3"
gem "lrucache", "0.1.4"
gem "mlanett-redis-lock", "0.2.7"
gem "mysql2", "~> 0.4.4"
gem "paper_trail", "~> 10.0.1"
gem "searchlight", "4.1.0"
gem "simple_form", "~> 4.1.0"
gem "virtus", "~> 1.0.5"
gem "whenever", "~> 0.10.0"

gem 'gds-api-adapters', "~> 53.2"
gem "gds-sso", "~> 13.6.0"
gem "govspeak", "~> 5.7.1"
gem 'govuk_admin_template', '6.6.0'
gem "govuk_app_config", "~> 1.10.0"
gem "plek", ">= 1.12.0"

# assets
gem "sass-rails", "~> 5.0", ">= 5.0.6"
gem "uglifier", ">= 2.7.2"
gem "therubyracer", "0.12.3", platforms: :ruby
gem "govuk_frontend_toolkit", "~> 8.1.0"
gem "select2-rails", "~> 4.0.0"

# development
group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "railroady"
  gem "thin"
end

group :development, :test do
  gem "pry-rails"
end

# testing
group :test do
  gem 'govuk-content-schema-test-helpers', '1.6.1'
  gem "govuk-lint", "3.9.0"

  gem 'capybara', '~> 3.12.0'
  gem 'factory_bot_rails', '~> 4.11'
  gem "fakefs", "0.18.0", require: "fakefs/safe"
  gem 'json-schema', '2.8.1'
  gem "rspec-rails", "~> 3.8.1"
  gem "shoulda-matchers", "3.1.2"
  gem "simplecov", "0.16.1"
  gem "simplecov-rcov", "0.2.3"
  gem 'webmock', '3.4.2'
end
