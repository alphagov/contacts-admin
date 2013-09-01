class SearchForm
  include Virtus
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # Search query
  attribute :q, String

  def results
    find(q).map { |result|
      SearchResult.new(result)
    }
  end

  def persisted?
    false
  end

  private

  # Return search results as Array of Hashes
  def find(query)
    search_client.search(query).results.map(&:marshal_dump)
  end

  def search_client
    HmrcContacts.mainstream_search_client
  end
end
