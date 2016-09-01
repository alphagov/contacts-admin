require 'gds_api/worldwide'
require 'gds_api/rummager'
require 'gds_api/publishing_api_v2'

module Services
  def self.worldwide_api
    @worldwide_api ||= GdsApi::Worldwide.new(Plek.current.find('whitehall-admin'))
  end

  def self.rummager_client
    @rummager_client ||= GdsApi::Rummager.new(Plek.new.find('rummager'))
  end

  def self.publishing_api
    @publishing_api ||= GdsApi::PublishingApiV2.new(
      Plek.current.find('publishing-api'),
      bearer_token: ENV['PUBLISHING_API_BEARER_TOKEN'] || 'example'
    )
  end
end
