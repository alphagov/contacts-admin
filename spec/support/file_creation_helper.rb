module FileCreationHelper
  def create_file(path, content)
    data_file = File.new(path, "w")
    data_file.write(content)
    data_file.close
  end
end
