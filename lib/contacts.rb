module Contacts
  autoload :Interactor, "contacts/interactor"

  mattr_accessor :rummager_client
  mattr_accessor :worldwide_api
  mattr_accessor :organisations_api
  mattr_accessor :enable_admin_routes
  mattr_accessor :publishing_api

  module_function
end
