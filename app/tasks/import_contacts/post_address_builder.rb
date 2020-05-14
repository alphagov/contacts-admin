class ImportContacts
  class PostAddressBuilder
    def self.build(contact, attributes)
      [{
        description: attributes["postaddresstag1"],
        address: attributes["postaddress1"],
      },
       {
         description: attributes["postaddresstag2"],
         address: attributes["postaddress2"],
       },
       {
         description: attributes["postaddresstag3"],
         address: attributes["postaddress3"],
       }].map do |post_address_attributes|
        contact.post_addresses.build(post_address_attributes)
      end
    end
  end
end
