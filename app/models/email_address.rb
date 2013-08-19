class EmailAddress < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :email_addresses, counter_cache: true

  validates :contact_record, presence: true
  validates :title, presence: true
  validates :email, presence: true
end
