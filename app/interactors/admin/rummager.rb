module Admin
  class Rummager
    def initialize(contact)
      @contact = contact
    end

    def call
      rummager_id        = @contact.link.sub(%r{^/}, '')
      rummager_presenter = ContactRummagerPresenter.new(@contact)
      Services.rummager_client.add_document("contact", rummager_id, rummager_presenter.present)
    end
  end
end
