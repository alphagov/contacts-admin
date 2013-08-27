require 'csv'

require 'import_contacts/more_info_url'
require 'import_contacts/more_info_record'
require 'import_contacts/contact_form_link_builder'
require 'import_contacts/office_builder'
require 'import_contacts/phone_number_builder'
require 'import_contacts/post_address_builder'
require 'import_contacts/email_address_builder'
require 'import_contacts/contact_record_builder'

class ImportContacts
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
