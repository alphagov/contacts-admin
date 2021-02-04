module Admin
  module PublishingApiSteps
    def it_should_have_redirected_the_page(contact, redirect_url)
      assert_publishing_api_unpublish(
        contact.content_id,
        type: "redirect",
        alternative_path: redirect_url,
      )
    end
  end
end
