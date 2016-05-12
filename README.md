DistDiff
========

For getting the difference of package names between two Ubuntu distributions using Ubuntu manifest file.

It will be helpful to convert a full Kubuntu installation to Ubuntu or vice-versa or similar other case.

Installation
------------
Install gem with

```ruby
gem install dist_diff
```

Usage of the executable
------------------------
From any command line client use this pattern

```bash
dist_diff from_ubuntu_manifest to_ubuntu_manifest
```
Where `from_ubuntu_manifest` is the manifest file of your current Ubuntu derivative and `to_ubuntu_manifest` is the derivative you want to switch to.

Usage in Ruby program or irb
----------------------------

```ruby
require 'dist_diff'

dist_diff = DistDiff.new('kubuntu-15.10-desktkop-amd64.manifest', 'ubuntu-15.10-desktkop-amd64.manifest')
dist_diff.extra_packages # To get the package names in Ubuntu not in Kubuntu
dist_diff.reverse_extra_packages # To get the reverse list, that is extra packages in Kubuntu
```

TODO
----
1. Interatively ask user about the derivatives and
2. Use Internet to fetch the manifest files of Ubuntu

Disclaimer
-----------

The developer of this program shall not be held responsible for any loss by using this program. It is your responsibilty to ensure that two compatible Ubuntu distribution's manifest files are given.