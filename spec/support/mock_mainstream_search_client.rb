require 'ostruct'

class MockMainstreamSearchClient
  attr_reader :results

  def initialize(*results)
    @results = results.map { |result| OpenStruct.new(result) }
  end

  def search(query, query_options = {})
    self
  end
end
