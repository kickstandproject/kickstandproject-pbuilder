#
# Copyright (C) 2011-2013, Polybeacon, Inc.
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
class pbuilder::client {
  # TODO add ccache to kickstandproject
  # require ccache::client
  include pbuilder::params
  include pbuilder::client::init
}

# vim:sw=2:ts=2:expandtab
