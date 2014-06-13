namespace :router do
  task :router_environment => :environment do
    require 'plek'
    require 'gds_api/router'

    @router_api = GdsApi::Router.new(Plek.current.find('router-api'))
  end

  task :register_backend => :router_environment do
    @router_api.add_backend('contacts-frontend-old', Plek.current.find('contacts-frontend-old', :force_http => true) + "/")
  end

  task :register_routes => :router_environment do
    @router_api.add_route('/contact/hm-revenue-customs', 'prefix', 'contacts-frontend-old')
  end

  desc "Register Contacts application and routes with the router"
  task :register => [ :register_backend, :register_routes ]
end
