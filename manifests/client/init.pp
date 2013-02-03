#
# Copyright (C) 2011-2013, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::client::init {
  include pbuilder::client::install
  include pbuilder::client::config

  File {
    group => $pbuilder::params::group,
    mode  => $pbuilder::params::mode,
    owner => $pbuilder::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab
