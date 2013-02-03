#
# Copyright (C) 2011-2013, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::common::init {
  include pbuilder::params
  include pbuilder::common::install
  include pbuilder::common::config

  File {
    group => $pbuilder::params::group,
    mode  => $pbuilder::params::mode,
    owner => $pbuilder::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab
