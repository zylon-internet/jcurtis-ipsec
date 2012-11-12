class ipsec::params {
  case $::osfamily {
    'Redhat': {
      $ipsec_name   = 'ipsec-tools'
      $dir          = '/etc/sysconfig/network-scripts'
      $template     = 'ipsec/ifcfg.erb'
      $dst_template = 'ipsec/dst-ifcfg.erb'
      $key_template = 'ipsec/keys.erb'
      $racoon_dir   = '/etc/racoon'
    }
    'Debian': {
      $ipsec_name   = ['ipsec-tools', 'racoon']
      $dir          = '/etc/sysconfig/network-scripts'
      $template     = 'ipsec/ifcfg.erb'
      $dst_template = 'ipsec/dst-ifcfg.erb'
      $key_template = 'ipsec/keys.erb'
      $racoon_dir   = '/etc/racoon'
    }
    default: {
      fail("Class['ipsec::params']: Unsupported osfamily: ${::osfamily}")
    }
  }
}
