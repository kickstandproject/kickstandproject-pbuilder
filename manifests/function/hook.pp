#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
define pbuilder::function::hook(
  $content,
  $ensure,
) {
  include pbuilder::client::config

  file { "${pbuilder::params::cachedir}/hook.d/${name}":
    ensure  => $ensure,
    content => $content,
    mode    => '0755',
    require => File["${pbuilder::params::cachedir}/hook.d"],
  }
}

# vim:sw=2:ts=2:expandtab
