class ImportContacts
  class ContactBuilder
    def self.build(attributes)
      new(attributes).build
    end

    def initialize(attributes = {})
      @attributes = attributes
      @contact = Contact.new(contact_attributes)
    end

    def attributes
      @attributes || {}
    end

    def contact_attributes
      {
        description: attributes['description'],
        contact_group: ContactGroup.find_by_title(attributes['clustergroup']),
      }
    end

    def build
      @contact.assign_attributes({
        contact_form_links: contact_form_link_records,
        email_addresses: email_address_records,
        post_addresses: post_address_records,
        phone_numbers: phone_number_records,
        more_info_website: more_info_text_for(:website),
        more_info_email_address: more_info_text_for(:email_address),
        more_info_post_address: more_info_text_for(:post_address),
        more_info_phone_number: more_info_text_for(:phone_number),
        title: title
      })

      @contact
    end

    private

    # In the CSV we have many offices, we will just pick the first one
    # it seems offices are like alias to help people search for contacts
    # we can do this by improving search and having better descriptions
    def title
      attributes.fetch('title', '').split(/\n/).map(&:strip).first
    end

    def contact_form_link_records
      ContactFormLinkBuilder.build(@contact, attributes).select(&:valid?)
    end

    def email_address_records
      EmailAddressBuilder.build(@contact, attributes).select(&:valid?)
    end

    def post_address_records
      PostAddressBuilder.build(@contact, attributes).select(&:valid?)
    end

    def phone_number_records
      PhoneNumberBuilder.build(@contact, attributes).select(&:valid?)
    end

    def more_info_text_for(record_type)
      more_info_record_for(record_type).to_markdown.squish
    end

    def more_info_record_for(record_type)
      "ImportContacts::MoreInfo#{record_type.to_s.classify}Builder".constantize.build(attributes)
    end
  end
end
