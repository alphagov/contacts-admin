class ImportContacts
  class EmailAddressBuilder
    def self.build(contact, attributes)
      [{
        title: attributes["emailtitle1"],
        description: attributes["emailtag1"],
        link: attributes["emailurl1"],
        email: attributes["emailaddress1"],
      }, {
        title: attributes["emailtitle2"],
        description: attributes["emailtag2"],
        link: attributes["emailurl2"],
        email: attributes["emailaddress2"],
      }].map do |email_address_attributes|
        contact.email_addresses.build(email_address_attributes)
      end
    end
  end
end
