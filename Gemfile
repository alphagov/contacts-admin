source "https://rubygems.org"

gem "rails", "4.2.7.1"

gem "active_hash", "1.4.0"
gem "mysql2", "~> 0.3.13"
gem "simple_form", "3.1.0"
gem "slimmer", "9.0.0"
gem "friendly_id", "5.1.0"
gem "unicorn", "~> 4.6.3"
gem "virtus", "~> 1.0.0.beta8"
gem "paper_trail", ">= 3.0.0.beta1"
gem "govspeak", "~> 3.6.0"
gem "gds-sso", "~> 9.3.0"
gem "gds-api-adapters", '28.1.0'
gem "lrucache", "0.1.4"
gem "plek", ">= 1.0.0"
gem 'govuk_admin_template', '4.2.0'
gem "mlanett-redis-lock", "0.2.6"

gem "airbrake", "3.1.15"

gem "whenever", "~> 0.8.4"

gem "searchlight"

gem 'ancestry', '2.0.0'

# assets
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 2.7.2"
gem "coffee-rails", "~> 4.0.0"
gem "therubyracer", "0.12.2", platforms: :ruby
gem "govuk_frontend_toolkit", "0.46.1"
gem "select2-rails", "3.5.5"

# development
group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets", "1.1.0"
  gem "railroady"
  gem "govuk-lint", "0.5.1"
  gem "thin"
end

group :development, :test do
  gem "pry-rails"
end

# testing
group :test do
  gem "ci_reporter"
  gem "rspec-rails", "~> 3.5.2"
  gem 'factory_girl_rails', '~> 4.7'
  gem "shoulda-matchers", "3.1.1"
  gem "fakefs", require: "fakefs/safe"
  gem 'capybara', '~> 2.8.1'
  gem "simplecov"
  gem "simplecov-rcov"
  gem 'webmock', '1.17.3'
  gem 'json-schema', '2.5.2'
  gem 'govuk-content-schema-test-helpers', '1.4.0'
end
