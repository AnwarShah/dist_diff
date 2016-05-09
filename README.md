DistDiff
========

For getting the difference of package names between two Ubuntu distributions using Ubuntu manifest file.

It will be helpful to convert a full Kubuntu installation to Ubuntu or vice-versa or similar other case.

Usage in Ruby program or irb
----------------------------

```ruby
dist_diff = DistDiff.new('kubuntu-15.10-desktkop-amd64.manifest', 'ubuntu-15.10-desktkop-amd64.manifest')
dist_diff.extra_packages # To get the package names in Ubuntu not in Kubuntu
dist_diff.reverse_extra_packages # To get the reverse list, that is extra packages in Kubuntu
```

TODO
----
1. Implement a command line helper
2. Implement fetching manifest file from Internet

Disclaimer
-----------

The developer of this program shall not be held responsible for any loss by using this program. It is your responsibilty to ensure that two compatible Ubuntu distribution's manifest files are given.