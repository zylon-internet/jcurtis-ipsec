# == Class: ipsec
#
# This class installs ipsec
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { ipsec:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Jared Curtis <jared@shift-e.info>
#
# === Copyright
#
# Copyright 2012 Jared Curtis, unless otherwise noted.
#
class ipsec {
  include ipsec::params

  package { 'ipsec':
    ensure => installed,
    name   => $ipsec::params::ipsec_name,
  }
}
