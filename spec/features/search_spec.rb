require 'spec_helper'

describe 'Search for information' do
  include SearchSteps

  # Use mock search for this example
  around { |example|
    search_client = Contacts.mainstream_search_client
    Contacts.mainstream_search_client = MockMainstreamSearchClient.new(
      {
        title: 'tax result',
        description: 'description',
        link: '/tax-result'
      }
    )

    example.run

    Contacts.mainstream_search_client = search_client
  }

  specify 'allows finding information from mainstream search index' do
    search_for('tax')

    verify search_result_exists('tax result')
  end
end
