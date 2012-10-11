class ipsec::params {
  if $::osfamily == 'redhat' {
    $ipsec_name   = 'ipsec-tools'
    $dir          = '/etc/sysconfig/network-scripts'
    $template     = 'ipsec/ifcfg.erb'
    $dst_template = 'ipsec/dst-ifcfg.erb'
    $key_template = 'ipsec/keys.erb'
    $racoon_dir   = '/etc/racoon'
  } else {
    fail("Class['ipsec::params']: Unsupported operatingsystem: ${::operatingsystem}")
  }
}
