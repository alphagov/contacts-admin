module Admin
  class DestroyContact
    include ::Contacts::Interactor

    takes(:contact)

    def destroy
      @contact.transaction do
        ::Contacts.rummager_client.delete(@contact.slug)
        @contact.destroy
      end
      rescue RestClient::RequestFailed, RestClient::RequestTimeout, RestClient::ServerBrokeConnection, SocketError
        @contact.errors.add(:base, "There was a system error trying to delete this, please try again later")
        false
    end
  end
end
