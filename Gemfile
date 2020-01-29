source "https://rubygems.org"

gem "rails", "~> 6.0"

gem "active_hash", "~> 3"
gem "ancestry", "~> 3"
gem "bootsnap", "~> 1"
gem "friendly_id", "~> 5"
gem "mlanett-redis-lock", "~> 0.2"
gem "mysql2", "~> 0.5"
gem "paper_trail", "~> 10"
gem "searchlight", "~> 4"
gem "simple_form", "~> 5"
gem "virtus", "~> 1"
gem "whenever", "~> 1.0"

gem "gds-api-adapters", "~> 63"
gem "gds-sso", "~> 14"
gem "govspeak", "~> 6"
gem "govuk_admin_template", "~> 6"
gem "govuk_app_config", "~> 2"
gem "plek", "~> 3"

# assets
gem "govuk_frontend_toolkit", "~> 9"
gem "sass-rails", "~> 6"
gem "select2-rails", "~> 4"
gem "uglifier", "~> 4"

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
  gem "govuk-content-schema-test-helpers"
  gem "rubocop-govuk", "~> 2"
  gem "scss_lint-govuk", "~> 0"

  gem "capybara", "~> 3"
  gem "factory_bot_rails", "~> 5"
  gem "fakefs", "~> 1.0", require: "fakefs/safe"
  gem "json-schema", "~> 2"
  gem "rspec-rails", "~> 3"
  gem "shoulda-matchers", "~> 4"
  gem "simplecov", "~> 0.18"
  gem "simplecov-rcov", "~> 0.2"
  gem "webmock", "~> 3"
end
