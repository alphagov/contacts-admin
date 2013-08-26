class ImportContacts
  class MoreInfoPostAddressBuilder
    def self.build(attributes)
      MoreInfoRecord.new(
        more_info_url: MoreInfoUrl.new({
          title: attributes['postmoreinfourltitle'],
          description: attributes['postmoreinfourltag'],
          url: attributes['postmoreinfourl']
        }),
        content: attributes['postmoreinfo']
      )
    end
  end
end
