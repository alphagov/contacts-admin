module Admin
  module PublishingApiSteps
    def it_should_have_archived_the_page(contact)
      assert_publishing_api_unpublish(
        contact.content_id,
        type: 'gone'
      )
    end

  private

    def contact_content(contact)
      {
        "document_type" => "gone",
        "schema_name" => "gone",
        "publishing_app" => "contacts",
        "routes" => [
          {
            "path" =>  contact.link,
            "type" =>  "exact"
          }
        ]
      }
    end
  end
end
