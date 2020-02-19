require "gds_api"
require "gds_api/publishing_api"

module Services
  def self.worldwide_api
    @worldwide_api ||= GdsApi.worldwide
  end

  def self.publishing_api
    @publishing_api ||= GdsApi::PublishingApi.new(
      Plek.new.find("publishing-api"),
      bearer_token: ENV["PUBLISHING_API_BEARER_TOKEN"] || "example",
    )
  end
end
