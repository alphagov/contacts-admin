class PostAddress < ActiveRecord::Base
  belongs_to :contact, inverse_of: :post_addresses, counter_cache: true

  validates :contact, presence: true
  validates :address, presence: true
end
