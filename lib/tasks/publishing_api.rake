require 'logger'
require 'gds_api/publishing_api'
require 'gds_api/publishing_api/special_route_publisher'

namespace :publishing_api do
  desc 'Publish special routes via publishing api'
  task publish_special_routes: :environment do
    special_route_publisher = GdsApi::PublishingApi::SpecialRoutePublisher.new(logger: Logger.new(STDOUT))
    special_route_publisher.publish(
      title: 'HMRC contacts finder',
      description: 'A filterable list of contact information from HMRC',
      content_id: 'b110c03c-3f8d-4327-906b-17ebd872e6a6',
      base_path: '/government/organisations/hm-revenue-customs/contact',
      type: 'exact',
      publishing_app: 'contacts-admin',
      rendering_app: 'contacts-frontend-old',
    )
  end
end

desc "Temporary alias of publishing_api:publish_special_routes for backward compatibility"
task "router:register" => "publishing_api:publish_special_routes"
