class SearchResult
  include Virtus::ValueObject

  attribute :title, String
  attribute :description, String
  attribute :format, String
  attribute :section, String
  attribute :link, String
  attribute :indexable_content, String
  attribute :es_score, Float

  def govuk_link
    ["https://www.gov.uk", link].join
  end
end
