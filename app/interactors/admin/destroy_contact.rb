require "contacts/publisher"

module Admin
  class DestroyContact
    include ::Contacts::Interactor

    takes(:contact)

    def destroy
      @contact.transaction do
        # Overwrite with a gone item in content-store
        presenter = ContactGonePresenter.new(@contact)
        ::Contacts::Publisher.publish(presenter)

        # Remove from site search
        rummager_id = @contact.link.gsub(%r{^/}, '')
        ::Contacts.rummager_client.delete(rummager_id)

        # Remove from our database
        @contact.destroy
      end
      rescue RestClient::RequestFailed, RestClient::RequestTimeout, RestClient::ServerBrokeConnection, SocketError
        @contact.errors.add(:base, "There was a system error trying to delete this, please try again later")
        false
    end
  end
end
