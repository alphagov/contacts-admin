require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

SLUG_FORMAT = /[A-Za-z0-9\-_]+/

module Contacts
  class Application < Rails::Application
    require 'contacts'

    config.autoload_paths += %W(
      #{config.root}/app/models/website
      #{config.root}/lib/
    )

    config.assets.precompile += %w(
      admin.css
      admin.js
    )

    config.i18n.enforce_available_locales = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Generators
    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.test_framework      :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
