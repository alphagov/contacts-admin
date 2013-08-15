class ImportContacts
  class WebsiteBuilder
    def self.build(contact_record, attributes)
      [{
         title: attributes['ogtitle1'],
         description: attributes['ogtag1'],
         link: attributes['ogurl1']
       },{
         title: attributes['ogtitle2'],
         description: attributes['ogtag2'],
         link: attributes['ogurl2']
       },{
         title: attributes['ogmoreinfourltitle'],
         description: attributes['ogmoreinfourltag'],
         link: attributes['ogmoreinfourl'],
         more_info: attributes['ogmoreinfo']
       }].map { |website_attributes|
         contact_record.websites.build(website_attributes)
       }
    end
  end
end
