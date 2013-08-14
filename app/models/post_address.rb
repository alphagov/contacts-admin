class PostAddress < ActiveRecord::Base
  belongs_to :contact, inverse_of: :post_addresses

  validates :contact, presence: true
end
