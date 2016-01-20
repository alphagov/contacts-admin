require "ostruct"

class MockMainstreamSearchClient
  attr_reader :results

  def initialize(*results)
    @results = results.map { |result| OpenStruct.new(result) }
  end

  def search(_query, _query_options = {})
    self
  end
end
