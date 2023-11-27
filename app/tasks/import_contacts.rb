require "csv"

class ImportContacts
  def initialize(file_path)
    @file_path = Pathname.new(file_path)

    raise ArgumentError, "#{file_path} does not exist" unless @file_path.exist?
  end

  def import(builder = ContactBuilder)
    csv_opts = { skip_blanks: true, encoding: "windows-1252:utf-8", headers: true }

    logger.info "Importing: Import_id, title"

    CSV.foreach(@file_path, **csv_opts) do |entry_row|
      hash = entry_row.to_hash
      contact = builder.build(hash)

      if contact.save
        logger.info "#{hash.fetch(%w[contactid], nil)}, #{hash.fetch(%w[title], '').split(/\n/).map(&:strip).first}"
      end
    end
  end
end
