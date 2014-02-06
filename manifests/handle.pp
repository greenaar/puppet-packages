define packages::handle (
  $ensure = 'installed'
) {

# TODO : validate options
  if ! ($ensure in [ 'installed', 'latest', 'absent' ]) {
    fail("\"${ensure}\" is not a valid ensure parameter value")
  }

  case $ensure {
    'installed': {
      if ! defined(Package[$name]) {
        package { $name: ensure => installed, }
      }
    }
    'latest': {
      if ! defined(Package[$name]) {
        package { $name: ensure => latest, }
      }
    }
    'absent': {
      if ! defined(Package[$name]) {
        package { $name: ensure => absent, }
      }
    }
    default: {}
  }

}
