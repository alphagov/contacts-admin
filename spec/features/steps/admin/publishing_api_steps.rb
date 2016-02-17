module Admin
  module PublishingApiSteps
    def it_should_have_archived_the_page(gone_uuid, contact)
      assert_publishing_api_put_content(
        gone_uuid,
        request_json_includes(contact_content(contact))
      )
    end

  private

    def contact_content(contact)
      {
        "format" => "gone",
        "publishing_app" => "contacts",
        "update_type" => "major",
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
