module Admin
  class DestroyContact
    def initialize(contact)
      @contact = contact
    end

    def destroy
      @contact.transaction do
        # Overwrite with a gone item in content-store
        presenter = ContactGonePresenter.new(@contact)
        Publisher.publish(presenter)

        # Remove from our database
        @contact.destroy
      end
    end
  end
end
