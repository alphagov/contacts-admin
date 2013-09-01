require 'gds_api/rummager'

rummager_host = ENV["RUMMAGER_HOST"] || Plek.current.find('search')

HmrcContacts.contacts_search_client = GdsApi::Rummager.new(
  rummager_host + HmrcContacts.search_index_path
)

HmrcContacts.mainstream_search_client = GdsApi::Rummager.new(
  rummager_host + '/mainstream'
)
