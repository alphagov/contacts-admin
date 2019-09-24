class ImportContacts
  class MoreInfoPhoneNumberBuilder
    def self.build(attributes)
      MoreInfoRecord.new(
        more_info_url: MoreInfoUrl.new(
          title: attributes["phonemoreinfourltitle"],
          description: attributes["phonemoreinfourltag"],
          url: attributes["phonemoreinfourl"],
        ),
        content: attributes["phonemoreinfo"],
      )
    end
  end
end
