Gem::Specification.new do |s|
  s.name        = 'dist_diff'
  s.version     = '0.3'
  s.date        = '2016-05-12'
  s.summary     = "A gem for finding the packages need to be installed to switch Ubuntu derivatives"
  s.description = "A simple gem to extract the differences of package names between Ubuntu derivatives so that it becomes easy to switch from one Ubuntu derivative to another"
  s.authors     = ["Mohammad Anwar Shah"]
  s.email       = 'mohammadanwarshah@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- spec/*`.split("\n")
  s.required_ruby_version = '>= 1.9.1'
  s.executables << 'dist_diff'
  s.homepage    =
    'http://rubygems.org/gems/dist_diff'
  s.license       = 'MIT'
end