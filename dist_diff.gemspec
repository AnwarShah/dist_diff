Gem::Specification.new do |s|
  s.name        = 'dist_diff'
  s.version     = '0.2'
  s.date        = '2016-05-12'
  s.summary     = "A gem for finding the packages need to be installed to switch Ubuntu derivatives"
  s.description = "A simple gem to extract the differences of package names between Ubuntu derivatives so that it becomes easy to switch from one Ubuntu derivative to another"
  s.authors     = ["Mohammad Anwar Shah"]
  s.email       = 'mohammadanwarshah@gmail.com'
  s.files       = ["lib/dist_diff.rb", "lib/dist_diff/file_reader.rb", "bin/dist_diff"]
  s.executables << 'dist_diff'
  s.homepage    =
    'http://rubygems.org/gems/dist_diff'
  s.license       = 'MIT'
end