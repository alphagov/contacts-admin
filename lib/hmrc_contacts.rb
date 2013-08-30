module HmrcContacts
  autoload :Interactor, 'hmrc_contacts/interactor'

  mattr_accessor :search_client

  module_function

  def rummager_host
    ENV.fetch('RUMMAGER_HOST', Plek.current.find('search'))
  end

  def search_index_path
    '/hmrc-contacts'
  end
end
