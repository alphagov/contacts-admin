class ImportContacts
  class PostAddressBuilder
    def self.build(contact_record, attributes)
      [{
         description: attributes['postaddresstag1'],
         address: attributes['postaddress1']
       },{
         description: attributes['postaddresstag2'],
         address: attributes['postaddress2']
       },{
         description: attributes['postaddresstag3'],
         address: attributes['postaddress3']
       }].map { |post_address_attributes|
         contact_record.post_addresses.new(post_address_attributes)
       }
    end
  end
end
