class EmailAddress < ActiveRecord::Base
  include Versioning
  include RegisterParent

  belongs_to :contact, inverse_of: :email_addresses, counter_cache: true

  validates :contact, presence: true
  validates :title, presence: true
  validates :email, presence: true
end
