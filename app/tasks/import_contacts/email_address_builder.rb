class ImportContacts
  class EmailAddressBuilder
    def self.build(contact_record, attributes)
      [{
         title: attributes['emailtitle1'],
         description: attributes['emailtag1'],
         link: attributes['emailurl1'],
         email: attributes['emailaddress1']
       },{
         title: attributes['emailtitle2'],
         description: attributes['emailtag2'],
         link: attributes['emailurl2'],
         email: attributes['emailaddress2']
       },{
         title: attributes['emailmoreinfourltitle'],
         description: attributes['emailmoreinfourltag'],
         link: attributes['emailmoreinfourl'],
         more_info: attributes['emailmoreinfo']
       }].map { |email_address_attributes|
         contact_record.email_addresses.new(email_address_attributes)
       }
    end
  end
end
