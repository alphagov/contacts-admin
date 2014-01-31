require 'gds_api/organisations'

Contacts.organisations_api = GdsApi::Organisations.new( Plek.current.find('whitehall-admin') )
