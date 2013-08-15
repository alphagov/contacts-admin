class ImportContacts
  class NumberBuilder
    def self.build(contact_record, attributes)
      [{
         title: attributes['telephonename'],
         description: attributes['phonetexthead'],
         open_hours: attributes['phoneopenhours'],
         number: attributes['telephone']
      },{
         title: attributes['telephonename2'],
         description: attributes['phonetexthead2'],
         open_hours: attributes['phoneopenhours2'],
         number: attributes['telephone2']
      }].map { |number_attributes|
        contact_record.numbers.build(number_attributes)
      }
    end
  end
end
