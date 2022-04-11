require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

SLUG_FORMAT = /[A-Za-z0-9\-_]+/

module Contacts
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.autoload_paths += %W[
      #{config.root}/app/models/website
    ]

    config.assets.precompile += %w[
      admin.css
      admin.js
    ]

    # Using a sass css compressor causes a scss file to be processed twice
    # (once to build, once to compress) which breaks the usage of "unquote"
    # to use CSS that has same function names as SCSS such as max.
    # https://github.com/alphagov/govuk-frontend/issues/1350
    config.assets.css_compressor = nil

    config.i18n.enforce_available_locales = true

    # Compiled assets are written to the location specified in config.assets.prefix.
    config.assets.prefix = "/assets/contacts-admin"

    # Generators
    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.test_framework      :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end

# Rotate SHA1 cookies to SHA256 (the new Rails 7 default)
# TODO: Remove this after existing user sessions have been rotated
# https://guides.rubyonrails.org/v7.0/upgrading_ruby_on_rails.html#key-generator-digest-class-changing-to-use-sha256
Rails.application.config.action_dispatch.cookies_rotations.tap do |cookies|
  salt = Rails.application.config.action_dispatch.authenticated_encrypted_cookie_salt
  secret_key_base = Rails.application.secrets.secret_key_base
  next if secret_key_base.blank?

  key_generator = ActiveSupport::KeyGenerator.new(
    secret_key_base, iterations: 1000, hash_digest_class: OpenSSL::Digest::SHA1
  )
  key_len = ActiveSupport::MessageEncryptor.key_len
  secret = key_generator.generate_key(salt, key_len)

  cookies.rotate :encrypted, secret
end
