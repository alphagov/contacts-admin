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
        contact_form_url: attributes['overrideurl'],
        meta_title: attributes['alt_meta_title'],
        meta_description: attributes['alt_meta_description'],
        textphone: attributes['textphone'],
        international_phone: attributes['international'],
        fax: attributes['fax'],
        email_text_head: attributes['emailtexthead'],
        post_name: attributes['post_name'],
        post_text_head: attributes['posttexthead']
      }
    end

    def build
      @contact_record.assign_attributes({
        contact_form_links: contact_form_link_records,
        email_addresses: email_address_records,
        post_addresses: post_address_records,
        phone_numbers: phone_number_records,
        contacts: contact_records,
        more_info_website: more_info_website_record,
        more_info_email_address: more_info_email_address_record,
        more_info_post_address: more_info_post_address_record,
        more_info_number: more_info_number_record
      })

      @contact_record
    end

    private

    def contact_records
      ContactBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def contact_form_link_records
      ContactFormLinkBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def email_address_records
      EmailAddressBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def post_address_records
      PostAddressBuilder.build(@contact_record, attributes).select(&:valid?)
    end

    def phone_number_records
      PhoneNumberBuilder.build(@contact_record, attributes).select(&:valid?)
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
