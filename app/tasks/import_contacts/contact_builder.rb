class ImportContacts
  class ContactBuilder
    def self.build(contact_record, attributes)
      attributes.fetch('title', '').split(/\n/).map(&:strip).map { |contact_title|
        contact_record.contacts.build({ title: contact_title })
      }
    end
  end
end
