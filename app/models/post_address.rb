class PostAddress < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :post_addresses

  validates :contact_record, presence: true
  validates :address, presence: true
end
