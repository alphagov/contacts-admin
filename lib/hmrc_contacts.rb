module HmrcContacts
  autoload :Interactor, 'hmrc_contacts/interactor'

  mattr_accessor :mainstream_search_client
  mattr_accessor :contacts_search_client

  module_function
end
