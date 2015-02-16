module Admin
  module PublishingApiSteps
    def gone_item_for(contact)
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

    def it_should_have_archived_the_page(contact)
      assert_publishing_api_put_item(contact.link, gone_item_for(contact))
    end
  end
end
