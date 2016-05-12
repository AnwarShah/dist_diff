# For getting the difference in package names between two Ubuntu distribution
# using Ubuntu manifest file
class DistDiff
  attr_reader :manifest_from, :manifest_to

  def initialize(manifest_from, manifest_to)
    @manifest_from = manifest_from
    @manifest_to = manifest_to
  end

  def extra_packages
    read_manifest_files
    list_diff
  end

  def reverse_extra_packages
    read_manifest_files if (to_pkgs and from_pkgs).nil?
    list_diff(true)
  end

  private

  attr_reader :to_pkgs, :from_pkgs

  def list_diff(reverse = false)
    unless reverse
      to_pkgs - from_pkgs
    else
      from_pkgs - to_pkgs
    end
  end

  def read_manifest_files
    @from_pkgs = read_packages_of(manifest_from)
    @to_pkgs = read_packages_of(manifest_to)
  end

  def read_packages_of(manifest_file)
    FileReader.new(manifest_file).package_names
  end
end

require 'dist_diff/file_reader'
