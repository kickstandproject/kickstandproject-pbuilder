#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
define pbuilder::function::distribution(
) {
  file { "${pbuilder::params::localbindir}/pbuilder-${name}-amd64":
    ensure  => present,
    content => template('pbuilder/pbuilder-distribution.erb'),
    mode    => '0755',
  }

  file { "${pbuilder::params::localbindir}/pbuilder-${name}-i386":
    ensure  => present,
    content => template('pbuilder/pbuilder-distribution.erb'),
    mode    => '0755',
  }

  /* XXX crontab module? */
  file { "/etc/cron.daily/pbuilder-${name}-amd64":
    ensure  => present,
    content => template('pbuilder/cron.daily/pbuilder.erb'),
    group   => root,
    mode    => '0755',
    owner   => root,
  }

  /* XXX crontab module? */
  file { "/etc/cron.daily/pbuilder-${name}-i386":
    ensure  => present,
    content => template('pbuilder/cron.daily/pbuilder.erb'),
    group   => root,
    mode    => '0755',
    owner   => root,
  }

  exec { "pbuilder-create-${name}-amd64":
    command => "${pbuilder::params::localbindir}/pbuilder-${name}-amd64 create --debootstrapopts --variant=buildd",
    creates => "${pbuilder::params::cachedir}/${name}-amd64-base.tgz",
    require => File["${pbuilder::params::localbindir}/pbuilder-${name}-amd64"],
    timeout => 1800,
  }

  exec { "pbuilder-create-${name}-i386":
    command => "${pbuilder::params::localbindir}/pbuilder-${name}-i386 create --debootstrapopts --variant=buildd",
    creates => "${pbuilder::params::cachedir}/${name}-i386-base.tgz",
    require => File["${pbuilder::params::localbindir}/pbuilder-${name}-i386"],
    timeout => 1800,
  }

  exec { "pbuilder-update-${name}-amd64":
    command     => "${pbuilder::params::localbindir}/pbuilder-${name}-amd64 update --override-config",
    onlyif      => "/usr/bin/test -f ${pbuilder::params::cachedir}/${name}-amd64-base.tgz",
    refreshonly => true,
    require     => File["${pbuilder::params::localbindir}/pbuilder-${name}-amd64"],
    subscribe   => File[$pbuilder::params::configfile],
  }

  exec { "pbuilder-update-${name}-i386":
    command     => "${pbuilder::params::localbindir}/pbuilder-${name}-i386 update --override-config",
    onlyif      => "/usr/bin/test -f ${pbuilder::params::cachedir}/${name}-i386-base.tgz",
    refreshonly => true,
    require     => File["${pbuilder::params::localbindir}/pbuilder-${name}-i386"],
    subscribe   => File[$pbuilder::params::configfile],
  }
}

# vim:sw=2:ts=2:expandtab
