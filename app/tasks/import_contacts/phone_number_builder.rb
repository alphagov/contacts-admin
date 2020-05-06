class ImportContacts
  class PhoneNumberBuilder
    def self.build(contact, attributes)
      [{
        title: attributes["telephonename"],
        description: attributes["phonetexthead"],
        open_hours: attributes["phoneopenhours"],
        number: attributes["telephone"],
        textphone: attributes["textphone"],
        international_phone: attributes["international"],
        fax: attributes["fax"],
      }, {
        title: attributes["telephonename2"],
        description: attributes["phonetexthead2"],
        open_hours: attributes["phoneopenhours2"],
        number: attributes["telephone2"],
      }].map { |number_attributes|
        contact.phone_numbers.build(number_attributes)
      }
    end
  end
end
