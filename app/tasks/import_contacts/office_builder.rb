class ImportContacts
  class OfficeBuilder
    def self.build(contact, attributes)
      attributes.fetch('title', '').split(/\n/).map(&:strip).map { |contact_title|
        contact.offices.build({
          title: contact_title,
          department: Department.hmrc
        })
      }
    end
  end
end
