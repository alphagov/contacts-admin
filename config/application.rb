require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'gds_api/worldwide'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

APP_SLUG = 'contacts'
SLUG_FORMAT = /[A-Za-z0-9\-_]+/

module Contacts
  class Application < Rails::Application
    require 'contacts'

    config.autoload_paths += %W(
      #{config.root}/app/models/website
    )

    config.assets.precompile += %w( admin.css admin.js frontend.css frontend.js )

    # Generators
    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.test_framework      :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.after_initialize do
      Contacts.worldwide_api = GdsApi::Worldwide.new(Plek.current.find('whitehall-admin'))
    end
  end
end
