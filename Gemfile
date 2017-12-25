source "https://rubygems.org"

gem "rails", "~> 5.0.2"

gem "active_hash", "1.5.2"
gem "mysql2", "~> 0.4.4"
gem "simple_form", "~> 3.5.0"
gem "friendly_id", "5.2.1"
gem "unicorn", "~> 5.4.0"
gem "virtus", "~> 1.0.5"
gem "paper_trail", "~> 7.0.2"
gem "govspeak", "~> 3.6.2"
gem "gds-sso", "~> 13.2.0"
gem 'gds-api-adapters', "~> 50.7"
gem "govuk_app_config", "~> 0.2.0"
gem "lrucache", "0.1.4"
gem "plek", ">= 1.12.0"
gem 'govuk_admin_template', '4.3.0'
gem "mlanett-redis-lock", "0.2.7"
gem "whenever", "~> 0.10.0"
gem "searchlight", "4.1.0"
gem 'ancestry', '2.1.0'

# assets
gem "sass-rails", "~> 5.0", ">= 5.0.6"
gem "uglifier", ">= 2.7.2"
gem "therubyracer", "0.12.3", platforms: :ruby
gem "govuk_frontend_toolkit", "~> 4.17.0"
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
  gem "rspec-rails", "~> 3.5.2"
  gem 'factory_girl_rails', '~> 4.7', '>= 4.7.0'
  gem "shoulda-matchers", "3.1.2"
  gem "fakefs", "0.9.1", require: "fakefs/safe"
  gem 'capybara', '~> 2.8.1'
  gem "simplecov", "0.12.0"
  gem "simplecov-rcov", "0.2.3"
  gem 'webmock', '2.3.2'
  gem 'json-schema', '2.5.2'
  gem 'govuk-content-schema-test-helpers', '1.4.0'
  gem "govuk-lint", "3.4.0"
end