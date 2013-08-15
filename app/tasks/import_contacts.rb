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

    def post_address_attributes
      [{
         description: attributes['postaddresstag1'],
         address: attributes['postaddress1']
       },{
         description: attributes['postaddresstag2'],
         address: attributes['postaddress2']
       },{
         description: attributes['postaddresstag3'],
         address: attributes['postaddress3']
       },{
       }]
    end

    def number_attributes
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
      },
      ]
    end

    def build
      @contact_record.websites.build(website_attributes)
      @contact_record.email_addresses.build(email_address_attributes)
      @contact_record.post_addresses.build(post_address_attributes)
      @contact_record.numbers.build(number_attributes)

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
