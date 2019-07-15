puppet-packages
===============

Module to handle package management via hiera

# Usage

in a manifest:
```
  include packages::manage
```
or
```
  class { 'packages::manage': }
```
in a hiera yaml: ( if loading through hiera_include('classes') )

---
```
classes:
  - packages::manage
```
## Configuration

This module exposes several configurable options.  While you can pass
these options through a manifest, this module works best when pulling
data out of hiera.

From a manifest:
```
class { 'packages::manage':
  install_packages => [''], # an array of packages which should have
                            # state => installed. Bulk install, default
                            # provider.
  latest_packages  => [''], # an array of packages which should have
                            # state => latest. Bulk install, default
                            # provider
  remove_packages  => [''], # an array of packages which should have
                            # state => purged. Bulk remove.
  install_version  => [''], # a hashed array of packages to manage,
                            # see hiera details.  Respects standard
                            # 'package' options.
}
```
From hiera:

----------------------------

```
packages::install:
  - 'nano'
  - 'curl'
  - 'unzip'

packages::latest:
  - 'puppet'
  - 'hiera'

packages::versioned:
  nethack-console:
    ensure: 'purged'
```
- note, when using 'packages::versioned', you may pass any standard
  packaging parameter to the entry. for example:
```
packages::versioned
  gear:
    ensure: 'latest'
    provider: 'pip'

packages::versioned:
  deep_merge:
    ensure: 'latest'
    provider: 'gem'
```
