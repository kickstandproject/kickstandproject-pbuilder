#
# Copyright (C) 2011-2013, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::client::install {
  package { $pbuilder::params::packagename:
    ensure => present,
  }
}

# vim:sw=2:ts=2:expandtab
