class ImportContacts
  class MoreInfoWebsiteBuilder
    def self.build(contact_record, attributes)
      contact_record.build_more_info_website(
        description: attributes['ogmoreinfo'],
        url_title: attributes['ogmoreinfourltitle'],
        url_description: attributes['ogmoreinfourltag'],
        url: attributes['ogmoreinfourl']
      )
    end
  end
end
