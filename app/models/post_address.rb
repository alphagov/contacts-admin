class PostAddress < ActiveRecord::Base
  belongs_to :contact, inverse_of: :post_addresses, counter_cache: true

  validates :contact, presence: true
  validates :title, presence: true
  validates :street_address, presence: true
  validates :postal_code, presence: true
  validates :world_location_slug, presence: true

  validates :address, absence: true

  def world_location
    WorldLocation.find(world_location_slug)
  end
end
