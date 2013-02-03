#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::common::config {
  require pbuilder::params

  file { $pbuilder::params::configfile:
    ensure  => present,
    content => template('pbuilder/etc/pbuilderrc.erb'),
  }

  file { $pbuilder::params::cachedir:
    ensure  => directory,
    require => File[$pbuilder::params::configfile],
  }

  file { "${pbuilder::params::cachedir}/ccache":
    ensure  => directory,
    require => File[$pbuilder::params::cachedir],
  }

  file { "${pbuilder::params::cachedir}/hook.d":
    ensure  => directory,
    purge   => true,
    require => File[$pbuilder::params::cachedir],
    recurse => true,
  }

  pbuilder::function::hook { 'D10repository':
    ensure  => present,
    content => template('pbuilder/hook.d/D10repository.erb'),
  }

  pbuilder::function::hook { 'D20aptupdate':
    ensure  => present,
    content => template('pbuilder/hook.d/D20aptupdate.erb'),
  }
}

# vim:sw=2:ts=2:expandtab
