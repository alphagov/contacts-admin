class EmailAddress < ActiveRecord::Base
  belongs_to :contact, inverse_of: :email_addresses

  validates :contact, presence: true
  validates :title, presence: true
  validates :email, presence: true
end
