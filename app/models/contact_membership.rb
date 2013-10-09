class ContactMembership < ActiveRecord::Base
  belongs_to :contact_group
  belongs_to :contact
end
