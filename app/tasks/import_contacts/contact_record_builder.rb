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
        contact_type: ContactType.find_by_title(attributes['clustergroup']),
        alt_meta_title: attributes['alt_meta_title'],
        alt_meta_description: attributes['alt_meta_description'],
        alt_meta_keywords: attributes['alt_meta_keywords'],
      }
    end

    def build
      @contact_record.websites = website_records
      @contact_record.email_addresses = email_address_records
      @contact_record.post_addresses = post_address_records
      @contact_record.numbers = number_records
      @contact_record.contacts = contact_records
      @contact_record.more_info_website = more_info_website_record
      @contact_record.more_info_email_address = more_info_email_address_record
      @contact_record.more_info_post_address = more_info_post_address_record
      @contact_record.more_info_number = more_info_number_record

      @contact_record
    end

    private

    def contact_records
      ContactBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def website_records
      WebsiteBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def email_address_records
      EmailAddressBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def post_address_records
      PostAddressBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def number_records
      NumberBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def more_info_website_record
      MoreInfoWebsiteBuilder.build(@contact_record, attributes)
    end

    def more_info_email_address_record
      MoreInfoEmailAddressBuilder.build(@contact_record, attributes)
    end

    def more_info_post_address_record
      MoreInfoPostAddressBuilder.build(@contact_record, attributes)
    end

    def more_info_number_record
      MoreInfoNumberBuilder.build(@contact_record, attributes)
    end
  end
end
