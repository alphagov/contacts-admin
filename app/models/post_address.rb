class PostAddress < ActiveRecord::Base
  belongs_to :contact, inverse_of: :post_addresses

  validates :contact, presence: true
  validates :title, presence: true
  validates :address, presence: true
end
