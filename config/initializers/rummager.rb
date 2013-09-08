require 'gds_api/rummager'
require 'rummageable'

rummager_host = ENV["RUMMAGER_HOST"] || Plek.current.find('search')

# Going to use the same index as mainstream till rummager has multi index search
# HmrcContacts.contacts_search_client = GdsApi::Rummager.new(
#   rummager_host + HmrcContacts.search_index_path
# )

HmrcContacts.mainstream_search_client = GdsApi::Rummager.new(
  rummager_host + '/mainstream'
)

RUMMAGER_INDEX = Rummageable::Index.new(rummager_host, 'mainstream', logger: Rails.logger)