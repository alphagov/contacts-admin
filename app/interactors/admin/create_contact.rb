module Admin
  class CreateContact
    def initialize(params)
      @params = params
    end

    def contact
      @contact ||= Contact.new(@params)
    end

    def save
      return false unless contact.save
      send_links_to_publishing_api
      true
    end

  private

    def send_links_to_publishing_api
      Publisher.client.put_links(
        contact.content_id,
        links: { organisations: [contact.organisation.content_id] }
      )
    end
  end
end
