require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module HmrcContacts
  class Application < Rails::Application
    require 'hmrc_contacts'

    config.autoload_paths += %W(
      #{config.root}/app/models/more_info_record
      #{config.root}/app/models/website
    )

    config.assets.precompile += %w( admin.css admin.js )

    # Generators
    config.generators do |g|
      g.orm                 :active_record
      g.template_engine     :erb
      g.test_framework      :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
