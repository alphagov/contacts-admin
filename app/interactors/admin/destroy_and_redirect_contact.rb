module Admin
  class DestroyAndRedirectContact
    attr_reader :contact, :redirect_to_location

    def initialize(contact, redirect_to_location)
      @contact = contact
      @redirect_to_location = redirect_to_location
    end

    def destroy_and_redirect
      contact.transaction do
        # Overwrite with a redirect item in content-store
        ::Contacts.publishing_api.put_content_item(contact.link, redirect_content_item)

        # Remove from site search
        rummager_id = contact.link.gsub(%r{^/}, '')
        ::Contacts.rummager_client.delete_document("contact", rummager_id)

        # Remove from our database
        contact.destroy
      end
    end

  private
    def redirect_content_item
      ContactRedirectPresenter.new(contact, redirect_to_location).present
    end
  end
end
