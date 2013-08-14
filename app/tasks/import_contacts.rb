class ImportContacts
  def initialize(file_path)
    @file_path = Pathname.new(file_path)

    raise ArgumentError.new("#{file_path} does not exist") unless @file_path.exist?
  end

  def import
    # placeholder
  end
end
