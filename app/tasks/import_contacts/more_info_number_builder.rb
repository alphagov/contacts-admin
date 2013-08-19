class ImportContacts
  class MoreInfoNumberBuilder
    def self.build(contact_record, attributes)
      contact_record.build_more_info_number(
        description: attributes['phonemoreinfo'],
        url_title: attributes['phonemoreinfourltitle'],
        url_description: attributes['phonemoreinfourltag'],
        url: attributes['phonemoreinfourl']
      )
    end
  end
end
