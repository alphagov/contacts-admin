class ImportContacts
  class MoreInfoContactFormBuilder
    def self.build(attributes)
      MoreInfoRecord.new(
        more_info_url: MoreInfoUrl.new(
          url: attributes["ogmoreinfourl"],
          title: attributes["ogmoreinfourltitle"],
          description: attributes["ogmoreinfourltag"]
        ),
        content: attributes["ogmoreinfo"]
      )
    end
  end
end
