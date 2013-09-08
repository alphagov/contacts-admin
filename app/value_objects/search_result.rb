class SearchResult
  include Virtus::ValueObject

  attribute :title, String
  attribute :description, String
  attribute :format, String
  attribute :section, String
  attribute :link, String
  attribute :indexable_content, String
  attribute :es_score, Float

  def contact?
    format == "contact"
  end

  def govuk_link
    # FIXME: Only for development
    root = contact? ? "" : "https://www.gov.uk"
    [root, link].join
  end
end
