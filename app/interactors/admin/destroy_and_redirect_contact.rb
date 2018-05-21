module Admin
  class DestroyAndRedirectContact
    attr_reader :contact, :redirect_to_location

    def initialize(contact, redirect_to_location)
      @contact = contact
      @redirect_to_location = redirect_to_location
    end

    def destroy_and_redirect
      contact.transaction do
        Services.publishing_api.unpublish(
          @contact.content_id,
          type: 'redirect',
          alternative_path: redirect_to_location
        )

        # Remove from our database
        contact.destroy
      end
    end
  end
end
