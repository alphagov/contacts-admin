source "https://rubygems.org"

gem "rails", "6.0.3.4"

gem "active_hash"
gem "ancestry"
gem "bootsnap"
gem "friendly_id"
gem "mlanett-redis-lock"
gem "mysql2"
gem "paper_trail"
gem "searchlight"
gem "simple_form"
gem "virtus"
gem "whenever"

gem "gds-api-adapters"
gem "gds-sso"
gem "govspeak"
gem "govuk_admin_template"
gem "govuk_app_config"
gem "plek"

# assets
gem "govuk_frontend_toolkit"
gem "sass-rails"
gem "select2-rails"
gem "uglifier"

# development
group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "railroady"
  gem "thin"
end

group :development, :test do
  gem "pry-rails"
  gem "rspec-rails"
end

# testing
group :test do
  gem "govuk-content-schema-test-helpers"
  gem "rubocop-govuk"
  gem "scss_lint-govuk"

  gem "capybara"
  gem "factory_bot_rails"
  gem "fakefs", require: "fakefs/safe"
  gem "json-schema"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "simplecov-rcov"
  gem "webmock"
end
