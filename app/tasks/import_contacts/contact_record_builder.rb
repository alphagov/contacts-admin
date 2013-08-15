class ImportContacts
  class ContactRecordBuilder
    def self.build(attributes)
      new(attributes).build
    end

    def initialize(attributes = {})
      @attributes = attributes
      @contact_record = ContactRecord.new(contact_attributes)
    end

    def attributes
      @attributes || {}
    end

    def contact_attributes
      {
        description: attributes['description'],
        keywords: attributes.fetch('keywords', '').to_s.split(","),
        contact_type: ContactType.find_by_title(attributes['clustergroup'])
      }
    end

    def build
      @contact_record.websites = WebsiteBuilder.build(@contact_record, attributes).select(&:valid?)
      @contact_record.email_addresses = EmailAddressBuilder.build(@contact_record, attributes).select(&:valid?)
      @contact_record.post_addresses = PostAddressBuilder.build(@contact_record, attributes).select(&:valid?)
      @contact_record.numbers = NumberBuilder.build(@contact_record, attributes).select(&:valid?)

      @contact_record
    end
  end
end
