class RelatedContentLink < Website
  belongs_to :contact, inverse_of: :related_content_links, counter_cache: true

  validates :contact, presence: true
end
