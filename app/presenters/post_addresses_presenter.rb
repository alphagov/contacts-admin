class PostAddressesPresenter
  include GovspeakHelper

  def initialize(post_addresses)
    @post_addresses = post_addresses
  end

  def present
    @post_addresses.map do |post|
      {
        title: post.title,
        street_address: post.street_address,
        postal_code: post.postal_code,
        world_location: post.world_location.title,
        locality: post.locality,
        region: post.region,
        description: govspeak(post.description),
      }
    end
  end
end
