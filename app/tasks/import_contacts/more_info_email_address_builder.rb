class ImportContacts
  class MoreInfoEmailAddressBuilder
    def self.build(contact_record, attributes)
      contact_record.build_more_info_email_address(
        description: attributes['emailmoreinfo'],
        url_title: attributes['emailmoreinfourltitle'],
        url_description: attributes['emailmoreinfourltag'],
        url: attributes['emailmoreinfourl']
      )
    end
  end
end
