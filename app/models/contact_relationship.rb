class ContactRelationship < ActiveRecord::Base
  belongs_to :contact
  belongs_to :related_contact, class_name: "Contact"
end
