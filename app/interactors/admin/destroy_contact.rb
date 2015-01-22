module Admin
  class DestroyContact
    def initialize(contact)
      @contact = contact
    end

    def destroy
      @contact.transaction do
        # Remove from site search
        rummager_id = @contact.link.gsub(%r{^/}, '')
        ::Contacts.rummager_client.delete(rummager_id)

        @contact.destroy
      end
      rescue RestClient::RequestFailed, RestClient::RequestTimeout, RestClient::ServerBrokeConnection, SocketError
        @contact.errors.add(:base, "There was a system error trying to delete this, please try again later")
        false
    end
  end
end
