Contacts::Application.configure do
  require "#{config.root}/spec/support/mock_organisations_api"
  require "#{config.root}/spec/support/fake_rummageable_index"

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.after_initialize do
    Contacts.enable_admin_routes = true

    if ENV['WHITEHALL_ADMIN'] 
      Contacts.worldwide_api = GdsApi::Worldwide.new( Plek.current.find('whitehall-admin') )
      Contacts.organisations_api = GdsApi::Organisations.new( Plek.current.find('whitehall-admin') )
    else
      Contacts.worldwide_api = GdsApi::Worldwide.new("https://www.gov.uk")
      Contacts.organisations_api = MockOrganisationsApi.new
    end
    
    Contacts.rummager_client = if ENV['RUMMAGER_API']
      Rummageable::Index.new(ENV['RUMMAGER_API'], 'mainstream', logger: Rails.logger)
    else
      FakeRummageableIndex.new("http://localhost", 'mainstream', logger: Rails.logger)
    end
  end
end
