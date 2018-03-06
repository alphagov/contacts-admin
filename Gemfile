source "https://rubygems.org"

gem "rails", "~> 5.0.2"

gem "active_hash", "1.5.3"
gem 'ancestry', '3.0.1'
gem "friendly_id", "5.2.3"
gem "lrucache", "0.1.4"
gem "mlanett-redis-lock", "0.2.7"
gem "mysql2", "~> 0.4.4"
gem "paper_trail", "~> 8.1.2"
gem "searchlight", "4.1.0"
gem "simple_form", "~> 3.5.1"
gem "virtus", "~> 1.0.5"
gem "whenever", "~> 0.10.0"

gem 'gds-api-adapters', "~> 51.4"
gem "gds-sso", "~> 13.6.0"
gem "govspeak", "~> 5.5.0"
gem 'govuk_admin_template', '6.5.0'
gem "govuk_app_config", "~> 1.3.2"
gem "plek", ">= 1.12.0"

# assets
gem "sass-rails", "~> 5.0", ">= 5.0.6"
gem "uglifier", ">= 2.7.2"
gem "therubyracer", "0.12.3", platforms: :ruby
gem "govuk_frontend_toolkit", "~> 7.4.2"
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
  gem 'govuk-content-schema-test-helpers', '1.6.0'
  gem "govuk-lint", "3.6.0"

  gem 'capybara', '~> 2.18.0'
  gem 'factory_girl_rails', '~> 4.7', '>= 4.7.0'
  gem "fakefs", "0.13.1", require: "fakefs/safe"
  gem 'json-schema', '2.8.0'
  gem "rspec-rails", "~> 3.7.2"
  gem "shoulda-matchers", "3.1.2"
  gem "simplecov", "0.15.1"
  gem "simplecov-rcov", "0.2.3"
  gem 'webmock', '3.3.0'
end
