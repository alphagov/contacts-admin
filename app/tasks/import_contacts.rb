require 'csv'

class ImportContacts
  class ContactBuilder
    def initialize(attributes = {})
      @attributes = attributes
    end
  end

  def initialize(file_path)
    @file_path = Pathname.new(file_path)

    raise ArgumentError.new("#{file_path} does not exist") unless @file_path.exist?
  end

  def import(builder = ContactBuilder)
    csv_opts = { skip_blanks: true, encoding: 'windows-1252:utf-8', headers: true }

    CSV.foreach(@file_path, csv_opts)  do |entry_row|
      contact = builder.build(entry_row.to_hash)
      contact.save
    end
  end
end
