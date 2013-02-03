#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::params {
  $cachedir = $::operatingsystem ? {
    default => '/var/cache/pbuilder',
  }

  $configfile = $::operatingsystem ? {
    default => '/etc/pbuilderrc',
  }

  $group = $::operatingsystem ? {
    default => 'root',
  }

  $mode = $::operatingsystem ? {
    default => '0644',
  }

  $owner = $::operatingsystem ? {
    default => 'root',
  }

  # TODO common module?
  $localbindir = $::operatingsystem ? {
    default => '/usr/local/bin',
  }

  $packagename = $::operatingsystem ? {
    default => 'pbuilder',
  }
}

# vim:sw=2:ts=2:expandtab
