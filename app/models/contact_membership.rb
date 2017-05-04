class ContactMembership < ApplicationRecord
  belongs_to :contact_group, counter_cache: :contacts_count
  belongs_to :contact
end
