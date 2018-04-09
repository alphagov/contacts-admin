module Admin
  class DestroyContact
    def initialize(contact)
      @contact = contact
    end

    def destroy
      @contact.transaction do
        Services.publishing_api.unpublish(
          @contact.content_id,
          type: 'gone'
        )

        # Remove from our database
        @contact.destroy
      end
    end
  end
end
