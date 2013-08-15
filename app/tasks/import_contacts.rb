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

    def build
      @contact_record.websites.build(website_attributes)

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
