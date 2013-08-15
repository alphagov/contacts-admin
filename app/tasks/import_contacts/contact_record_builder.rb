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
      WebsiteBuilder.build(@contact_record, attributes)
      EmailAddressBuilder.build(@contact_record, attributes)
      PostAddressBuilder.build(@contact_record, attributes)
      NumberBuilder.build(@contact_record, attributes)

      @contact_record
    end
  end
end
