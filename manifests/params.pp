#
# Copyright (C) 2011, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::params {
  $cachedir = $::operatingsystem ? {
    default => '/var/cache/pbuilder',
  }

  $configdir = $::operatingsystem ? {
    default => '/etc/pbuilder',
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

  /* XXX TODO common module? */
  $localbindir = $::operatingsystem ? {
    default => '/usr/local/bin',
  }

  $packagename = $::operatingsystem ? {
    default => 'pbuilder',
  }

  $components = $pbuilder_components ? {
    ''      => 'main universe',
    default => $pbuilder_components,
  }

  $distributions = $pbuilder_distributions ? {
    ''      => 'precise',
    default => $pbuilder_distributions,
  }

  $mirror = $pbuilder_mirror ? {
    ''      => 'ca.archive.ubuntu.com',
    default => $pbuilder_mirror,
  }

  $mirror_protocol = $pbuilder_mirror_protocol ? {
    ''      => 'http://',
    default => $pbuilder_mirror_protocol,
  }
}

# vim:sw=2:ts=2:expandtab
