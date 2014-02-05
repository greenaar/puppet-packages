# == Class: package
#
# Full description of class package here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { package:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Aaron Greengrass <aaron@thatserver.ca>
#
class package::manage (
  $install_packages = hiera_array('packages::install',undef),
  $latest_packages = hiera_array('packages::latest',undef),
  $remove_packages = hiera_array('packages::remove',undef),
  $install_packages_gems = hiera_array('packages::install::gems',undef),
  $install_version = hiera_hash('packages::versioned',undef)
) {

  if $install_packages {
    package { $install_packages:
      ensure => installed,
    }
  }

  if $latest_packages {
    package { $latest_packages:
      ensure => latest,
    }
  }

  if $remove_packages {
    package { $remove_packages:
      ensure => purged,
    }
  }

  if $install_packages_gems {
    package { $install_packages_gems:
      ensure   => installed,
      provider => gem,
    }
  }

  $install_defaults = {
    ensure => 'installed',
  }

  if $install_version {
      create_resources(package, $install_version, $install_defaults)
  }

}

