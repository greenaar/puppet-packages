# === Package handler
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
# For bulk operations, make sure the package isn't defined otherwhere
define packages::handle (
  $ensure = 'installed',
  $debug = false
) {

# TODO : validate options
  if ! ($ensure in [ 'installed', 'latest', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  if ! defined(Package[$name]) {
    package { $name: ensure => $ensure, }
  } else {
    if $debug {
      notify { "${name}-exists":
        message => "${name} is defined elsewhere, this command has caught it and prevented a failure. Please fix.",
      }
    }
  }
}
