require 'gds_api/need_api'

NEEDS_API_CLIENT_CREDENTIALS = {}  # This should be replaced on deploy

Contacts.needs_api = GdsApi::NeedApi.new( Plek.current.find('need-api'), NEEDS_API_CLIENT_CREDENTIALS )
