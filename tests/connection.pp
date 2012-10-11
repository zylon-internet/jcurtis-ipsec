include ipsec
ipsec::connection { 'Foo-To-Bar':
  destination => '192.168.76.99',
  psk         => 'secret'
}

ipsec::connection { 'Server1-To-Server3':
  ensure      => 'absent',
  destination => '192.168.76.99',
  psk         => 'secret2'
}

ipsec::connection { 'Server1-To-Server4':
  ensure      => 'absent',
  destination => '192.168.76.99',
  psk         => 'secret3'
}
