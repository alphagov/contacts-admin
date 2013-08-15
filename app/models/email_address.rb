class EmailAddress < ActiveRecord::Base
  belongs_to :contact_record, inverse_of: :email_addresses

  validates :contact_record, presence: true
  validates :title, presence: true
  validates :email, presence: { if: ->(o) { o.more_info.blank? } }
end
