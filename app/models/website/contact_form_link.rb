class ContactFormLink < Website
  belongs_to :contact_record, inverse_of: :contact_form_links, counter_cache: true

  validates :contact_record, presence: true
end
