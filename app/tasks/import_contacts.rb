require 'csv'

class ImportContacts
  class WebsiteRecordBuilder
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
        contact_record.numbers.new(number_attributes)
      }
    end
  end

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

  class ContactRecordBuilder
    def self.build(attributes)
      new(attributes).build
    end

    def initialize(attributes = {})
      @attributes = attributes
      @contact_record = ContactRecord.new(contact_attributes)
    end

    def attributes
      @attributes || {}
    end

    def contact_attributes
      {
        description: attributes['description'],
        keywords: attributes.fetch('keywords', '').to_s.split(","),
        contact_type: ContactType.find_by_title(attributes['clustergroup'])
      }
    end

    def build
      WebsiteRecordBuilder.build(@contact_record, attributes)
      EmailAddressBuilder.build(@contact_record, attributes)
      PostAddressBuilder.build(@contact_record, attributes)
      NumberBuilder.build(@contact_record, attributes)

      @contact_record
    end
  end

  def initialize(file_path)
    @file_path = Pathname.new(file_path)

    raise ArgumentError.new("#{file_path} does not exist") unless @file_path.exist?
  end

  def import(builder = ContactRecordBuilder)
    csv_opts = { skip_blanks: true, encoding: 'windows-1252:utf-8', headers: true }

    CSV.foreach(@file_path, csv_opts)  do |entry_row|
      contact_record = builder.build(entry_row.to_hash)
      contact_record.save
    end
  end
end
