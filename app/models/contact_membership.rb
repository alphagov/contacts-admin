class ContactMembership < ActiveRecord::Base
  validates :contact_id, uniqueness: {scope: :contact_group_id}
  validates :contact_id, presence: true
  validates :contact_group_id, presence: true
end
