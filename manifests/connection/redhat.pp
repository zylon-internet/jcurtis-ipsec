class ipsec::connection::redhat
{

  if $ensure == 'present' {
    $ifupdown = 'ifup'
  } else {
    $ifupdown = 'ifdown'
  }

  include ipsec

  file { "ifcfg-${name}":
    ensure  => $ensure,
    path    => "${ipsec::params::dir}/ifcfg-${name}",
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['ipsec'],
  }

  file { "keys-${name}":
    ensure  => $ensure,
    path    => "${ipsec::params::dir}/keys-${name}",
    content => template($key_template),
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => File["ifcfg-${name}"],
    notify  => Exec["${ifupdown} ${name}"],
  }

  exec { "ifup ${name}":
    path        => ['/sbin'],
    creates     => "${ipsec::params::racoon_dir}/${destination}.conf",
  }

  exec { "ifdown ${name}":
    path        => ['/sbin'],
    refreshonly => true,
  }

  # Export to destination server
  # rotate the name for the export 
  $dst_name = regsubst($name,'(.*)-(.*)-(.*)','\3-\2-\1')
  @@ipsec::connection { "${dst_name}":
    destination  => $source,
    source       => $destination,
    onboot       => $onboot,
    ike_method   => $ike_method,
    psk          => $psk,
    template     => $template,
    dst_template => $dst_template,
    key_template => $key_template,
    ensure       => $ensure,
    tag          => "ipsec-${destination}",
  }
}
