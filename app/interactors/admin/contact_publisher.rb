module Admin
  class ContactPublisher
    def initialize(contact)
      @contact = contact
    end

    def call
      presenter = ContactPresenter.new(@contact)
      Publisher.publish(presenter)
    end
  end
end
