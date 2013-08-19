class ImportContacts
  class MoreInfoPostAddressBuilder
    def self.build(contact_record, attributes)
      contact_record.build_more_info_post_address(
        description: attributes['postmoreinfo'],
        url_title: attributes['postmoreinfourltitle'],
        url_description: attributes['postmoreinfourltag'],
        url: attributes['postmoreinfourl']
      )
    end
  end
end
