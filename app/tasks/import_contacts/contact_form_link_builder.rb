class ImportContacts
  class ContactFormLinkBuilder
    def self.build(contact, attributes)
      [{
         title: attributes['ogtitle1'],
         link: attributes['ogurl1']
       },{
         title: attributes['ogtitle2'],
         link: attributes['ogurl2']
       }].map { |contact_form_attributes|
         contact.contact_form_links.build(contact_form_attributes)
       }
    end
  end
end
