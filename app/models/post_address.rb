class PostAddress < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :post_addresses, counter_cache: true

  validates :contact_record, presence: true
  validates :address, presence: true
end
