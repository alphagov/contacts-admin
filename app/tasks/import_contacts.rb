require 'csv'

class ImportContacts
  class ContactRecordBuilder
    def self.build(attributes)
      new(attributes).build
    end

    def initialize(attributes = {})
      @attributes = attributes
      @contact_record = ContactRecord.new
    end

    def attributes
      @attributes || {}
    end

    def website_attributes
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
       }]
    end

    def email_address_attributes
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
       }]
    end

    def build
      @contact_record.websites.build(website_attributes)
      @contact_record.email_addresses.build(email_address_attributes)

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
