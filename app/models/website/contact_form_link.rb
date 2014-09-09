class ContactFormLink < Website
  include RegisterParent
  belongs_to :contact, inverse_of: :contact_form_links, counter_cache: true

  validates :contact, presence: true
end
