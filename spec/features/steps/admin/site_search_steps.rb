require 'gds_api/test_helpers/json_client_helper'

module Admin
  module SiteSearchSteps
    def it_should_have_added_the_page_to_search(contact)
      # Checks that it's being added as the correct document type
      rummager_presenter = ContactRummagerPresenter.new(contact)
      expected_json = rummager_presenter.present.merge(_type: 'contact')

      # exports to JSON so that the public_timestamp timestamp
      # is in a string and can be compared to the JSON captured by Webmock
      expected_json = JSON.parse(expected_json.to_json)
      assert_rummager_posted_item(expected_json)
    end

    def it_should_have_removed_the_page_from_search(contact)
      rummager_id = contact.link.gsub(%r{^/}, '')
      assert_rummager_deleted_item(rummager_id)
    end
  end
end
