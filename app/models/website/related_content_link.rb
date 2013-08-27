class RelatedContentLink < Website
  belongs_to :contact_record, inverse_of: :related_content_links, counter_cache: true

  validates :contact_record, presence: true
end
