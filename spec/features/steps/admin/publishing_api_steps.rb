module Admin
  module PublishingApiSteps
    def gone_item_for(gone_uuid, contact)
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

    def it_should_have_archived_the_page(gone_uuid, contact)
      assert_publishing_api_put_content(gone_uuid, gone_item_for(gone_uuid, contact))
    end
  end
end
