# versioned handler
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

define packages::versioned (
  $data,
  $debug = false
) {
  if ( ! defined(Package[$name]) ) {
    package { $name:
      ensure             => $data[$name]['ensure'],
      adminfile          => $data[$name]['adminfile'],
      allowcdrom         => $data[$name]['allowcdrom'],
      category           => $data[$name]['category'],
      configfiles        => $data[$name]['configfiles'],
      description        => $data[$name]['description'],
      flavor             => $data[$name]['flavor'],
      instance           => $data[$name]['instance'],
      platform           => $data[$name]['platform'],
      provider           => $data[$name]['provider'],
      responsefile       => $data[$name]['responsefile'],
      root               => $data[$name]['root'],
      source             => $data[$name]['source'],
      status             => $data[$name]['status'],
      vendor             => $data[$name]['vendor'],
      alias              => $data[$name]['alias'],
      audit              => $data[$name]['audit'],
      before             => $data[$name]['before'],
      loglevel           => $data[$name]['loglevel'],
      noop               => $data[$name]['noop'],
      notify             => $data[$name]['notify'],
      require            => $data[$name]['require'],
      schedule           => $data[$name]['schedule'],
      subscribe          => $data[$name]['subscribe'],
      tag                => $data[$name]['tag'],
    }
  } else {
    if $debug {
      notify { "${name}-exists":
        message => "${name} is defined elsewhere, this command has caught it and prevented a failure. Please fix.",
      }
    }
  }
}
