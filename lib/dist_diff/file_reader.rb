# Reads a Ubuntu Iso manifest file and output the package names
class FileReader
  attr_reader :manifest_file

  def initialize(manifest_file)
    @manifest_file = manifest_file
  end

  def package_names
    file_content = readfile(manifest_file)
    extract_package_names_into_array(file_content)
  end

  private

  def readfile(filename)
    File.open(filename, 'r') do |f|
      f.read
    end
  end

  def extract_package_names_into_array(file_content)
    file_content.split(' ').select.with_index { |_, i| i.even? }
  end
end