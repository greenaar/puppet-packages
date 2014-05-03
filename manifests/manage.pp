# == Class: packages:manage
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
#
class packages::manage (
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

