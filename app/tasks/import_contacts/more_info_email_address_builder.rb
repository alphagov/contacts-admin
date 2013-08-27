class ImportContacts
  class MoreInfoEmailAddressBuilder
    def self.build(attributes)
      MoreInfoRecord.new(
        more_info_url: MoreInfoUrl.new({
          title: attributes['emailmoreinfourltitle'],
          description: attributes['emailmoreinfourltag'],
          url: attributes['emailmoreinfourl']
        }),
        content: attributes['emailmoreinfo']
      )
    end
  end
end
