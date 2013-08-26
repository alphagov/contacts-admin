class RelatedContentLink < Website
  belongs_to :contact_record, inverse_of: :websites, counter_cache: true
end
