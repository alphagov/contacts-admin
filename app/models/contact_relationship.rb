class ContactRelationship < ApplicationRecord
  belongs_to :contact
  belongs_to :related_contact, class_name: "Contact"
end
