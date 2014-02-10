module Admin
  class DestroyContact
    include ::Contacts::Interactor

    takes(:contact)

    def destroy
      @contact.transaction do
        RUMMAGER_INDEX.delete(@contact.slug)
        if @contact.questions.none?
          @contact.destroy
        else
          @contact.errors.add(:base, "Must reassign #{@contact.questions.count} #{"question".pluralize(@contact.questions.count)}")
          false
        end
      end
      rescue RestClient::RequestFailed, RestClient::RequestTimeout, RestClient::ServerBrokeConnection, SocketError
        @contact.errors.add(:base, "There was a system error trying to delete this, please try again later")
        false
    end
  end
end
