class ImportContacts
  class OfficeBuilder
    def self.build(contact_record, attributes)
      attributes.fetch('title', '').split(/\n/).map(&:strip).map { |contact_title|
        contact_record.offices.build({
          title: contact_title,
          department: Department.hmrc
        })
      }
    end
  end
end
