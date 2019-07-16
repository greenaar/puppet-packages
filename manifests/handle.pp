#
# === Package handler
#
# For bulk operations, make sure the package isn't defined otherwhere
define packages::handle (
  $ensure = 'installed',
  $debug = false
) {

# TODO : validate options
  if ! ($ensure in [ 'installed', 'latest', 'absent', 'purged' ]) {
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
