module Admin
  class DestroyContact
    include ::Contacts::Interactor

    takes(:contact)

    def destroy
      begin
        @contact.transaction do
          RUMMAGER_INDEX.delete(@contact.slug)
          @contact.destroy
        end
      rescue RestClient::RequestFailed, RestClient::RequestTimeout, RestClient::ServerBrokeConnection
        false
      end
    end
  end
end
